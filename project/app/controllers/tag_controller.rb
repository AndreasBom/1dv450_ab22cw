class TagController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :access_control

  #GET show all tags
  def index
    @tags = Tag.all
    render json: @tags, status: :ok
  end

  #GET show one tag
  def show
    @tag = Tag.find(params[:id])
    if !@tag.nil?
      render json: @tag, status: :ok
    else
      render json: @tag.errors, status: :not_found
    end
  end


  #POST create tag
  def create
    @tag = Tag.new params.permit(:name)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entry
    end
  end


end
