class LikesController < ApplicationController
  def new
    @like = Like.new
    authorize @like
  end

  def like
    user_like = current_user.likes.find_by(photo_id: params[:photo_id])
    photo = Photo.find(params[:photo_id])
    authorize photo

    if user_like.present?
      user_like.destroy
    else
      current_user.likes.create(photo_id: params[:photo_id])
    end
    redirect_to event_photo_path(photo.event, photo)
  end
end
