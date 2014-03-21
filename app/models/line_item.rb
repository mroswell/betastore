class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  before_validation :set_price
  after_save :increment_order_total_amount

  def set_price
    self.price = product.price
  end

  def total_price
    price * quantity
  end

  def increment_order_total_amount
    order.increment_total_amount(total_price)
    # order.total_amount ||= 0
    # order.total_amount += total_price
    # order.save!
  end
end
