class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  belongs_to :photos
  has_many :event_guests
  has_many :events, through: :event_guests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_not_guest?(event)
    !event.in?(events)
  end
end
