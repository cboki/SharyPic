class Tag < ApplicationRecord
  has_many :phototags
  has_many :photos, through: :phototags
end
