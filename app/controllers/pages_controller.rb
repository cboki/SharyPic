class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :camera]
  def home
    @disable_nav = true
    redirect_to events_path unless current_user.nil?
  end

  def camera
  end
end
