class Category < ActiveRecord::Base
has_many :categorizations
has_many :products, :through => :categorizations

# Category - name exists
validates :name, presence: true

end

