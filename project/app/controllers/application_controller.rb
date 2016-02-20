class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper


  # Requests needs to have custom header 'X-Api-Key' with a valid api key
  def access_control
    api_key = request.headers['X-Api-Key']
    access_ok = Api.find_by key: api_key

    unless access_ok
      head status: :unauthorized
      false
    end
  end

end
