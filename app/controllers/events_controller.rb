class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[current_user_id])
    @event = @user.events.build(events_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end
end
