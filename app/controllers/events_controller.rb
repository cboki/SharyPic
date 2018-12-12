class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
end
