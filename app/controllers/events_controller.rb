class EventsController < ApplicationController
  include EventsHelper
  before_action :require_session, except: [:index]
  before_action :creator?, only: %i[edit destroy]

  def index
    @event = Event.all
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    set_event
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event '#{@event.name}' created!"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = @event.errors
      render 'new'
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
