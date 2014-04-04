require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

#order_id exists, product_id exists
  def test_order_id_exists
    li = LineItem.new(product_id:1, quantity:1)
    assert_equal false, li.save
    assert li.errors[:order_id].include? ("can't be blank")
  end

    def test_product_id_exists
    li = LineItem.new(price:29.99, quantity:1)
    assert_equal false, li.save
    assert li.errors[:product_id].include? ("can't be blank")
  end
end
