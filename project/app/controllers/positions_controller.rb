class PositionsController < ApplicationController
  before_action :access_control

  def index
    positions = Position.all
    render json: positions, status: :ok
  end

  def show
    position = Position.find(params[:id])

    if !position.nil?
      render json: position, status: :ok
    else
      render json: position.errors, status: :not_found
    end

  end

  #POST create new position
  def create
    position = Position.new(position_params)

    if position.save
      render json: position, status: :created
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
