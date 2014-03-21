Customer.delete_all
CreditCard.delete_all
LineItem.delete_all
Order.delete_all
# 100.times do
#   cc = CreditCard.new( credit_card_number; Faker::Business.credit_card_number)
#    Customer.create!(name: Faker::Name.name,
#     credit_cards: [cc])
# end


# progress_bar = ProgressBar.new('Fake Data Gen', 100)
product_ids = Product.pluck(:id)

25.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
    )
#has_many
 puts      "created customer #{customer.name}"


  cc = customer.credit_cards.create!(
    card_number: Faker::Business.credit_card_number    )

    # expires_on: Faker::Business.credit_card_expiry_date
         puts "created customer #{cc.card_number}"


(rand(5) + 1).times do
  order = customer.orders.create!
  puts "Placed order #{order.id}"
  pids = product_ids.dup
  (rand(5) + 1).times do
    li = order.line_items.create!(
      product_id: pids.shuffle!.pop,
      quantity:rand(5) + 1)
    puts li.inspect
  end

  # sum = 0
  # order.line_items.ech do |li|
  # ....

  #order.total_amount = order.line_items.inject(0) {|sum,li| sum + li.total_price }
    # order.total_amount = order.line_items.inject(0) {|sum,li| sum + li.total_price }
 # order.increment_total_amount
 # puts "order.calculate_total_amount = #{order.total_amount}"
 # order.save! #bang raises exception if there is a p

end
end



#     rand(4) +1.times do
#       order = customer.orders.create()

# end





# product_ids = Product.pluck(:id)

# rand(5)+1.times do
#   order = Order.create!(placed_at:DateTime::now)
#   customer.orders<< order
#   product_ids = Product.pluck(:id)
#   #product_ids = Product.all.map(&:id)

# (rand(5)+1).times do
#   random_product_id = product_ids.sample
#   #random_product = Product.find(random_product_id)
#   product_ids.delete(random_product_id)
#   order.line_items.create!(
#      product_id:random_product_id,
#      quantity: (rand(5) + 1),
#      price: random_product.price)

# end
# end

# module Faker
#     class Name
#       def self.name
#       end
#     end
#   end
# end

