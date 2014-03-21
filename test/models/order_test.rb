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

  # test "the truth" do
  #   assert true
  # end
end
