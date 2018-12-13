class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :nearby]
  skip_after_action :verify_authorized, only: :nearby
  def index
    @events = policy_scope(Event)
    # policy_scope(Event) .addOtherMethods
  end

  def show
    @event = authorize Event.find(params[:id])
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

  def nearby
    @latitude = params[:lat].to_f
    @longitude = params[:lon].to_f
    @accuracy = params[:acc].to_i

    @events = Event.near([@latitude, @longitude], 1)

    if @events.any?
      respond_to do |format|
        format.json # { render json: @events } <-- will render `app/views/events/nearby.js.erb`
      end
    end
  end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to events_path }
    #     format.js  # <-- idem
    #   end
    # end
  private

  def event_params
    params.require(:event).permit(:name, :location, :radius, :start_date, :end_date, :access_key)
  end
end
