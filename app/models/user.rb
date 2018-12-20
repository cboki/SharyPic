class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  has_many :event_guests
  has_many :events, through: :event_guests
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_not_guest?(event)
    !event.in?(events)
  end

  def is_liking?(photo)
    likes.find_by(photo_id: photo.id).present?
  end

  def user_avatar
    self.photo.nil? ? "unknown.png" : self.photo
  end

  def name
    customized_name = self.email.split('@').first
    self.username.nil? ? customized_name : self.username
  end
end
