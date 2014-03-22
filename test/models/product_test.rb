require 'test_helper'

class ProductTest < ActiveSupport::TestCase
# name exists, price exists and is a number greater than 0

  def test_product_has_name
    customer = Product.new
    assert_equal false, customer.save
    assert_equal ["can't be blank"],
    customer.errors[:name]
  end

    def test_product_has_price
    customer = Product.new(name:'Wallet')
    assert_equal false, customer.save
    #assert_equal ["can't be blank"],
    customer.errors[:name]
  end

  def test_product_price_greater_than_0
    customer = Product.new(name:'Wallet', price: 0)
    assert_equal false, customer.save
    #assert_equal ["can't be blank"],
    customer.errors[:name]
  end
end
