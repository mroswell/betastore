# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
# test = Customer.create(name: 'John Doe', email: 'test@example.com')
# Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

# muffin = Product.create(name: 'Muffin', price: 2.99)
# smoothie = Product.create(name: 'Smoothie', price: 3.75)
# coffee = Product.create(name: 'Coffee', price: 3.99)

# order = Order.create(customer: me, placed_at: '2013-09-27')
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: me, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: test, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: coffee)

clothing = Category.create(name: 'Clothing')
headware = Category.create(name: 'Headware')
misc = Category.create(name: 'Misc')
mobile = Category.create(name: 'mobile')

hoodie = Product.create(name: 'Betamore Hoodie', price: 19.99, img_url: "/images/products/hoodie.jpg", categories: [clothing])
hat = Product.create(name: 'Betamore Hat', price: 16.99, img_url: "/images/products/hat.jpg", categories: [headware])
iphone_case = Product.create(name: 'iPhone Case', price: 19.99, img_url: "/images/products/iphone_case.jpg", categories: [mobile])
journal = Product.create(name: 'Betamore Journal', price: 10.00, img_url: "/images/products/journal.jpg", categories: [misc])
shirt = Product.create(name: 'T-Shirt', price: 19.99, img_url: "/images/products/shirt.jpg", categories: [clothing])
sticker = Product.create(name: 'Betamore Sticker', price: 2.00, img_url: "/images/products/sticker.jpg", categories: [misc])

Rails.logger.info "putting hat into some categories"
headware.products << hat

puts "hat categories #{hat.categories.map{|c| c.name}}"
puts "hat categories #{hat.categories.map(&:name)}"

me = Customer.create(name: 'Margie', email:'mroswell@betamore.com')
me.credit_cards.create(card_number: '4111111111111111', expires_on: '2017-04-01')

