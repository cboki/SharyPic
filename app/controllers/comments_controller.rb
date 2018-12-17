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
      redirect_to event_photo_path(@photo.event_id, @photo.id)
    else
      render 'photos/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
