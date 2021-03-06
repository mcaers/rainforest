class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :comment, :product_id, :user_id, :user, :product

  validates :comment, :product, :user, :presence => true

end
