class ApplicationController < ActionController::Base
  include Response

  skip_before_action :verify_authenticity_token
end
