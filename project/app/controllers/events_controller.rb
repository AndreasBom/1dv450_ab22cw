class EventsController < ApplicationController
  include ActionController::Rescue
  protect_from_forgery with: :null_session
  before_filter :authenticate, only: [:create, :destroy]
  before_action :access_control
  before_filter :limit_response



  #GET show/all will show all events
  def index
    #if show/all?tag=tagName
    if !params[:tag].nil?
      events = Event
             .joins(events_tags:  :tag)
             .where(tags: {name: params[:tag]})

      events = events.drop(@offset)
      events = events.take(@limit)

      response = {offset: @offset,
                  limit: @limit,
                  count: events.count,
                  data: events}

      render json: response, include: [:tags, :creator, :position], status: :ok

      #if show/all?search=searchQuery
      #search in name or message of the events
    elsif !params[:search].nil?

      events = Event.where(
          "message LIKE ?
            OR name LIKE ?",
          "%#{params[:search]}%", "%#{params[:search]}%")
      response = {query: params[:search],
                  count: events.count,
                  data: events}
      render json: response, include: [:tags, :creator, :position], status: :ok

    # show all events
    else
      events = Event.order("updated_at DESC").all
      if !events.nil?

        events = events.drop(@offset)
        events = events.take(@limit)

        response = {offset: @offset,
                    limit: @limit,
                    count: events.count,
                    data: events}
        render json: response, include: [:tags, :creator, :position], status: :ok
      else
        render json: events.errors, status: :ok
      end
    end


  end

  #GET show/:id shows a specified event
  def show
    event = Event.find(params[:id])
    if !event.nil? then
      render json: event, include: [:tags, :creator, :position], status: :ok
    end
  end

  #POST Create new event and add tags
  def create
    event = Event.new(event_params.except(:tags, :positions))

    event.creator = Creator.find_by creatorname: @creator_name

    if event_params[:tags].present?
      tags_params = event_params[:tags]
      tags_params.each do |tag|
        #If tag exists in database, associate this tag, else create a new tag
        if Tag.exists?(tag)
          event.tags << Tag.find_by(tag)
        else
          event.tags << Tag.new(tag)
        end
      end
    end

    if event_params[:positions].present?
      position = event_params[:positions]

      #If position already exists
      if Position.exists?(position)
        existed_position = Position.find_by_name(position["name"])
        event.position_id = existed_position.id
        event.save
      else
        #else create a new
        new_position = Position.new(position)
        new_position.save
        event.position = new_position
        event.save
      end

      position = event_params[:positions]

      if Position.exists?(position)
        event.position = Position.find_by(position)
      else
        new_position = Position.create(position)
        event.position = new_position
      end
    end

    if event.save
      render json: event, include: [:tags,:creator, :position], status: :created
    else
      render json: event.errors, status: :unprocessable_entry
    end
  end

  #DELETE delete a specified event
  def destroy
    event = Event.find(params[:id])

    if event.destroy
      render json: {"message": "Record was deleted", status: :ok, },  status: :ok
    else
      render json: {"message": "You are not authorized to delete this event"}, status: :unauthorized
    end



  end

  private

  def query_params
    params.permit(:tag)
  end

  def event_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.permit(:message, :name, :rating, tags:[:name], positions: [:latitude, :longitude, :name])
  end
end
