require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def test_create
    order = Order.new
    assert order.save
  end

  def test_total_revenue
    assert_equal 42, Order.total_revenue
  end

  def test_first
    # assert_equal 42, Order.first.total_amount
    assert_equal 42, Order.total_revenue
  end

 # customer_id exists, credit_card_id exists
 # and the credit card belongs to the customer placing the order

  def customer_id_exists
    order = Order.new
    assert_equal false, order.save
    # assert_equal ["can't be blank"],
    assert order.errors[:customer_id].include? ("can't be blank")
  end
end
