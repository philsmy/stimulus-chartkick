class Customer < ApplicationRecord
  has_many :purchases
  has_many :ordered_purchases, -> { order(purchased_at: :desc) }, class_name: "Purchase"
end
