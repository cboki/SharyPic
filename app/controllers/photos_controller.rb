class PhotosController < ApplicationController
  # skip_before_action :authenticate_user!
  def show
    # @photo = authorize Photo.find(params[:id])
  end

  def new

  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.event = Event.last
    @photo.save
    authorize @photo
  end

  def destroy
    # authorize @photo
  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end
end
