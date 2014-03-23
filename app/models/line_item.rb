class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  before_validation :set_price
  after_save :increment_order_total_amount

  validates :order_id, presence: true
  validates :product_id, presence: true

  def set_price
    self.price = Product.price
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
