class EventsController < ApplicationController

  #GET show/all will show all events
  def index
    events = Event.all

    if !events.nil?
      render json: events, include: :tags, status: :ok
    else
      render json: events.errors, status: :not_found
    end

  end

  #GET show/:id shows a specified event
  def show
    event = Event.find(params[:id])
    if !event.nil?
      render json: event, include: :tags, status: :ok
    else
      render nothing: true, status: :not_found
    end
  end

  #POST Create new event and add tags
  def create
    event = Event.new(event_params.except(:tags))

    if event_params[:tags].present?
      tags_params = event_params[:tags]
      tags_params.each do |tag|
        #If tag exists in database, associate this tag, else create a new tag
        if Tag.exists?(tag[:name])
          event.tags << tag
        else
          event.tags << Tag.new(tag)
        end

      end
    end

    if event.save
      render json: event, status: :created
    else
      render json: event.errors, status: :unprocessable_entry
    end
  end

  def addtag

  end

  private

  def event_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.permit(:message, :name, :rating, tags:[:message, :name, :rating])
  end
end
