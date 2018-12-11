class PhotosController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    # @photo = authorize Photo.find(params[:id])
  end

  def new
    # authorize @photo
  end

  def create
    # authorize @photo
  end

  def destroy
    # authorize @photo
  end
end
