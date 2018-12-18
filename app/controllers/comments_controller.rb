class CommentsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    authorize @photo
    @comment = Comment.new(comment_params)
    @comment.commentable = @photo
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to event_photo_path(@photo.event_id, @photo.id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "photo/new" }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
