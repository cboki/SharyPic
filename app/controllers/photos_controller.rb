class PhotosController < ApplicationController
  # skip_before_action :authenticate_user!

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :googleApi

  def show
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

  def googleApi
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    photo = Photo.first
    file_name = photo.file
    response = image_annotator.label_detection(image: file_name)
    response.responses.each do |res|
      res.label_annotations.each do |label|
        in_tabel = Tag.find_by(name: label.description)
        if in_tabel.nil?
          @tag = Tag.new
          @tag.name = label.description
          @tag.save
        end
        tag = Tag.find_by(name: label.description)
        @photo_tag = PhotoTag.create(
          tag: tag,
          photo: photo
        )
      end
    end
    # need to add a redircet to the photopage
  end
end
