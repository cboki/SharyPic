class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :camera]
  def home
    @disable_nav = true
  end

  def camera
  end
end
