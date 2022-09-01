class Review < ApplicationRecord
  belongs_to :dish

  validates :rating, presence: true
end
