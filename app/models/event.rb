class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :eventguests
  has_many :users, through: :eventguests
  has_many :comments, as: :commentable
end
