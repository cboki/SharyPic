class Photo < ApplicationRecord
  #require "google/cloud/vision"
  belongs_to :event
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  has_many :comments, as: :commentable

  validates :file, :event, presence: true
end
