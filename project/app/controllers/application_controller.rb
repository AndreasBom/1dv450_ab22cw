
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :four_o_four


  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @creator_name = username
      if Creator.find_by(creatorname: username)
        Creator.find_by(creatorname: username).authenticate(password)
      end
    end
  end



  # Requests needs to have custom header 'X-Api-Key' with a valid api key
  def access_control
    api_key = request.headers['X-Api-Key']
    access_ok = Api.find_by key: api_key

    unless access_ok
      head status: :forbidden
      false
    end
  end

  # DEFAULT
  OFFSET = 0
  LIMIT = 25

  # offset and limit response
  def limit_response
    if params[:offset].present?
      @offset = params[:offset].to_i
    end
    if params[:limit].present?
      @limit = params[:limit].to_i
    end
    @offset ||= OFFSET
    @limit  ||= LIMIT
  end

  private

  def four_o_four
    render json: {"message": "Not Found", "status_code": 404}, status: :not_found
  end


end

