class EventGuest < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true, uniqueness: { scope: :user }
end
