class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @events = Event.all has now to be
    # policy_scope(Event) .addOtherMethods
  end

  def show
    @event = authorize Event.find(params[:id])
    @users = User.all
    @photos = Photo.all
    authorize @photos
  end

  def new
    @event = current_user.events.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    # authorize @event
  end

  def update
    # authorize @event
  end

  def destroy
    # authorize @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :radius, :start_date, :end_date, :access_key)
  end
end
