class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :nearby, :search]
  skip_after_action :verify_authorized, only: [:nearby, :search]
  def index
    @events = policy_scope(Event)
    if !current_user.nil? && !current_user.active_event_id.nil?
      @active_event = policy_scope(Event).find(current_user.active_event_id)
      @latest_event = policy_scope(Event).find(current_user.events.last.id)
    end
    # policy_scope(Event) .addOtherMethods
  end

  def show
    @event = Event.all
    @event = authorize Event.find(params[:id])
    @eventguest = EventGuest.new
      if current_user.nil?
        redirect_to new_user_session_url
      end
  end

  def new
    @event = current_user.events.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    authorize @event
    if @event.save!
      current_user.active_event_id = @event.id
      current_user.events << @event
      redirect_to event_path(@event), notice: "Your event has been successfully added."
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

  def search
    @acevents = policy_scope(Event).pluck(:name)
    if params[:query].present?
      @events = policy_scope(Event).where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def nearby
    @latitude = params[:lat].to_f
    @longitude = params[:lon].to_f
    @accuracy = params[:acc].to_i

    @events = Event.near([@latitude, @longitude], 50)
    @events.each { |event| event.distance = (event.distance * 100).to_i }

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
