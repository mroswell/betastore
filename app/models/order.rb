class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items

 # sum = 0, li=line_items[0]
 # sum = 9.99, li = line_items[1]
 # sum = 29.99, li = line_items[2]
  #  def calculate_total_amount
  #   self.total_amount = line_items.inject(0)  do |sum, li|
  #     sum + li.total_price
  #   end
  # end


def increment_total_amount(amount)
  update(total_amount: (total_amount || 0) + amount)
  # self.total_amount ||= 0
  # self.total_amount += total_price
  # save
end

def self.recent
  where('created_at > ?',1.day.ago)
end


def self.total_revenue
  connection.select_value("select sum(total_amount) from orders").to_f
end

def self.total_revenue_per_customer
  connection.select_all("select customer_id, sum(total_amount)
    FROM orders
    GROUP BY customer_id")

  # group(:customer_id).sum(:total_amount)

  # where(('created_at > ?',1.day.ago).group(:customer_id).sum(:total_amount)
end
end
