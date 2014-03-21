class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :credit_cards

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  # Customer - name exists, email exists and is unique
end
