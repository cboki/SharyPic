class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :camera]
  def home
    render layout: "application_landing_page"
  end
  def camera
  end
end
