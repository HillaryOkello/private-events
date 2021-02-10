class EventsController < ApplicationController
  before_action :require_session, except: [:index]
  before_action :creator?, only: %i[edit destroy]

  def index
    @event = Event.all
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = User.find(session[:current_user_id])
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
