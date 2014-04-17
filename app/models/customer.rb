class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :credit_cards

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  # Customer - name exists, email exists and is unique

  def self.verify(token)
    customer_id = Rails.application.message_verifier('customer').verify(token)
    customer = Customer.find(customer_id)
    customer.update!(verified_at: Time.current) unless customer.verified_at
    customer
  # rescue ActiveSupport::MessageVerifier::InvalidSignature
     rescue
    nil
  end
end
