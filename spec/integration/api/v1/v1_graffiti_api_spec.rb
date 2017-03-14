require "rails_helper"

RSpec.feature "v1 Graffiti API", type: :request, speed: :slow do

  context "#show" do

    it "should have valid json" do
      create(:graffiti)

      get("http://localhost:3000/api/v1/graffiti/1")

      expect(response).to be_success
      expect(response).to be_valid_json_for_schema("graffiti/show")
    end

  end

end