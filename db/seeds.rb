require 'faker'

40.times do
  customer = Customer.new
  customer.name = Faker::Name.name
  customer.save!
end

product_name = 20.times.map { Faker::Commerce.product_name }

200.times do
  purchase = Purchase.new
  purchase.purchased_at = Faker::Time.between(from: 2.weeks.ago, to: 12.hours.ago)
  purchase.purchase_amount = Faker::Commerce.price
  purchase.item_name = product_name.sample
  purchase.quantity = Faker::Number.between(from: 1, to: 10)
  purchase.status = ['Completed', 'Shipped', 'Delivered'].sample
  purchase.customer_id = Customer.all.sample.id
  purchase.save!
end
