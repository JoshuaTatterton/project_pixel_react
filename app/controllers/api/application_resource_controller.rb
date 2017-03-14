class Api::ApplicationResourceController < ApplicationController
  include JSONAPI::ActsAsResourceController

  protect_from_forgery with: :null_session
end