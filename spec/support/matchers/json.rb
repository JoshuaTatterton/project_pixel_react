require "json-schema"
require "oj"

RSpec::Matchers.define :be_valid_json do
  match do |response|
    @body = response.respond_to?(:body) ? response.body : response
    begin
      Oj.load(@body)
    rescue Oj::ParseError => ex
      @error = ex.message
      false
    end
  end

  failure_message do
    [
      "Validating #{@body} returned errors.",
      "Errors:\n#{@error}"
    ].join("\n\n")
  end
end

RSpec::Matchers.define :be_valid_json_schema do
  match do |response|
    @body = response.respond_to?(:body) ? response.body : response
    schema_path = @body

    # Validate schema against 'json_api/metaschema' which has some extra reqstrictions.
    metaschema = Rails.root.join("spec", "schemas", "json_api", "metaschema.schema.json").expand_path.to_s

    # Validate metaschema w/ separate validation instead of `validate_schema: true` so 'draft-04' schema is
    # loaded from json-schema gem cache instead of attempting to download from Internet. It fails on CI.
    @errors = JSON::Validator.fully_validate_schema(metaschema, clear_cache: false)
    @errors += JSON::Validator.fully_validate(metaschema, schema_path, clear_cache: false)
    @errors.empty?
  end

  failure_message do
    [
      "Validating #{@body} returned errors.",
      "Errors:\n#{@errors.join("\n")}"
    ].join("\n\n")
  end
end

RSpec::Matchers.define :be_valid_json_for_schema do |schema_name|
  match do |response|
    @body = response.respond_to?(:body) ? response.body : response
    schema_path = Rails.root.join("spec", "schemas", "#{schema_name}.schema.json").expand_path.to_s

    @errors = []
    # Don't use 'strict: true' since it has side-effect making all properties required.
    # Use 'additionalProperties: false' in schema instead.
    begin
      # Use 'validate_schema: true' in addition to above so json-schema gem loads all schemas from its cache
      @errors += JSON::Validator.fully_validate(schema_path, @body, strict: false, validate_schema: true)
    rescue JSON::Schema::ValidationError, JSON::Schema::SchemaError => error
      @errors << error
    end
    @errors.empty?
  end

  failure_message do
    [
      "Validating body with #{schema_name} returned errors.",
      "Errors:\n#{@errors.join("\n")}",
      "Body:\n#{@body}"
    ].join("\n\n")
  end
end

# Extend built-in matcher instead of defining new one to get base functionality like pretty diff
class IncludeApiErrorMatcher < RSpec::Matchers::BuiltIn::Include
  def initialize(*expected)
    if expected.length == 1 && expected.first.is_a?(Hash)
      super(errors: expected.first.map { |source, error| { detail: error, title: error, source: { pointer: source.to_s } }.with_indifferent_access })
    else
      super(errors: expected.map { |exp| { detail: exp } })
    end
  end
end

def include_api_error(*args)
  IncludeApiErrorMatcher.new(*args)
end
