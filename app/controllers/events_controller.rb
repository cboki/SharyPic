class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :nearby]
  skip_after_action :verify_authorized, only: :nearby
  def index
    @events = policy_scope(Event)
    # policy_scope(Event) .addOtherMethods
  end

  def show
    # @event = authorize Event.find(params[:id])
  end

  def new
    # authorize @event
  end

  def create
    # authorize @event
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
    latitude = params[:lat]
    longitude = params[:lon]
    @events = Event.near([latitude, longitude], 1)

    if @events.any?
      respond_to do |format|
        format.json { render json: @events } # <-- will render `app/views/events/nearby.js.erb`
      end
    end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to events_path }
    #     format.js  # <-- idem
    #   end
    # end
  end
end
