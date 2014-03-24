class AddExpiresOnFromCreditCard < ActiveRecord::Migration
  def change
    add_column :credit_cards, :expires_on, :date
  end
end
