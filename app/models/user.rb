class User < ApplicationRecord
  has_many :event_guests
  has_many :events, through: :event_guests
  has_many :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
