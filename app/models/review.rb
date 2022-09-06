class Review < ApplicationRecord
  belongs_to :dish

  validates :rating, presence: true

  scope :poor, -> { where("rating < ?", 3) }
  # don't write  poor = Review.where(rating < 3), active
  # record doesn't understand bigger or smaller than, can only check it it's equal.


  # you can do another scope, like created less than a month ago and combine
  # them together with .poor.last_month. You can't do this otherwiste because you
  # don't just have one instance, you have an array of instance and you can't call
  # a self on an array.

  def concerned_users
    self.dish.menu.restaurant.users # because the connection table is has many through so it's directly accessible
    # or dish.menu.restaurant
  end
end
