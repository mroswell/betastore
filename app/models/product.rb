class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :categorizations
  has_many :categories, :through => :categorizations

  # name exists, price exists and is a number greater than 0
  validates :name, presence: true
#  validates :name, :format => {:with => /a/i, :message => "product must have an a in it."}
  validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  validates :price, presence: true, numericality: { greater_than: 0, allow_blank: true }

  scope :search, -> (q) { where('name ilike ?', "%#{q}%") }
end
