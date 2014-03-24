class CreditCard < ActiveRecord::Base
  belongs_to :customer

  before_validation :expires_on

  validates :card_number, presence: true
  validates :card_number, length: { minimum: 15 }
  validates :card_number, numericality: true
  validates :expiration_date, format: { with: /\A\d{2}\/\d{4}\z/, message: "Only MM/YYYY allowed" }
  #validates :expires_on, numericality { greater_than: Time.now }
  validates :expires_on, :numericality => {:greater_than => Time.now}

  # create a writer method to make this work

  def expires_on=(expiration_date)
    self.expires_on = Date.strptime(expiration_date,'%m/%Y')+1.month
  end

end
