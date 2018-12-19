class PhotosController < ApplicationController
  # skip_before_action :authenticate_user!

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :googleApi

  def show
    @event = authorize Event.find(params[:event_id])
    @photo = authorize Photo.find(params[:id])
    @comment = Comment.new
  end

  def new
  end

  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.user = current_user
    @photo.event = Event.find(current_user.active_event_id)
    if @photo.save!
      render json: { event_id: @photo.event_id }
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy

    redirect_to @photo.event
  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end
end
