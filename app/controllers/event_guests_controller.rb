class EventGuestsController < ApplicationController
  def new
  end

  def create
    @event = Event.find(params[:event_id])
    authorize @event
    @user = current_user
    @event_guest = EventGuest.create(
      user: @current_user,
      event: @event
    )
    redirect_to event_path(@event)
  end
end
