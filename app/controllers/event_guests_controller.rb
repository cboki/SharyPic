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
    @user.active_event_id = @event.id
    flash[:notice] = 'Event successfully joined and now active' if @user.save!
    redirect_to event_path(@event)
  end
end
