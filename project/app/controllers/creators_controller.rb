class CreatorsController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session
  before_action :access_control


  def index
    render nothing: true, status: :ok
  end

  #GET show a single creator
  def show
    creator = Creator.find(params[:id])
    if !creator.nil?
      render json: creator, status: :ok
    else
      render json: creator.errors, status: :not_found
    end
  end


  def new
    creator = Creator.new
  end

  #POST create new creator
  def create
    creator = Creator.new(creator_params)

    if creator.save
      render json: creator, status: :created
    else
      render json: creator.errors, status: :unprocessable_entry
    end

  end


=begin
  def delete

  end
=end

  private
=begin
  def set_user
    user = User.find(params[:id])
  end
=end

  def event_params


  end

  def creator_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.permit(:creatorname, :email, :password, :password_confirmation)
    #params.permit(:creatorname, :email, :password, :password_confirmation)
  end

end
