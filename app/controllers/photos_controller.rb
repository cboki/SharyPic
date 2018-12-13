require "byebug"

class PhotosController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :googleApi
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
