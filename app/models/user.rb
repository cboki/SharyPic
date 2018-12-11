class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :eventguests
  has_many :events, through: :eventguests
  has_many :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
