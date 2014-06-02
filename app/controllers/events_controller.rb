class EventsController < ApplicationController

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    # @events = Event.paginate(page: params[:page]).per_page(10)
    @events_upcoming = Event.upcoming.paginate(page: params[:upcoming])
    @events_past = Event.past.paginate(page: params[:past])
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end

end
