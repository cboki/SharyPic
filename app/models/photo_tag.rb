class PhotoTag < ApplicationRecord
  belongs_to :tag
  belongs_to :photo

  validates :photo, presence: true
  validates :tag, presence: true, uniqueness: { scope: :photo }
end
