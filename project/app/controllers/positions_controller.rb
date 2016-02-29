class PositionsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :access_control

  #GET show/all
  def index
    positions = Position.all
    render json: positions, status: :ok
  end

  #GET show/:id
  def show
    position = Position.find(params[:id])

    if !position.nil?
      render json: position, status: :ok
    else
      render json: position.errors, status: :not_found
    end
  end

  #GET show/:id/nearby
  def nearby
    this_position = Position.find(params[:id])
    neighboring = this_position.nearbys(10)

    render json: neighboring, status: :ok
  end

  #POST positions/create
  # Create new position
  def create
    position = Position.new(position_params)

    if position.save
      render json: position, status: :created
    else
      render json: position.errors, status: :unprocessable_entry
    end

  end

  def destroy
    if Position.destroy(Position.find(params[:id]))
      render json: {"message": "Position was deleted", status: :ok}
    else
      render json: position.errors, status: :unprocessable_entry
    end
  end


  private

  def position_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.permit(:latitude, :longitude, :name)
  end

end
