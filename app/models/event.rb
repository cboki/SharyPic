class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :event_guests
  has_many :photos
  has_many :users, through: :event_guests
  has_many :comments, as: :commentable
  has_many :likes, through: :photos
  has_many :photo_comments, through: :photos, source: :comments

  validates :creator, presence: true
  validates :name, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def background_url
    self.photos.first&.file.to_s
  end

  def event_avatar
    self.photos.first.nil? ? "default_avatar.png" : self.photos.first.file
  end
end
