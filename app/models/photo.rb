class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :phototags
  has_many :tags, through: :phototags
  has_many :comments, as: :commentable
end
