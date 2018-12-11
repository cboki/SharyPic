class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :camera]
  def home
  end
  def camera
  end
end
