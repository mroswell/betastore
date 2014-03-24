class RemoveExpiresOnFromCreditCard < ActiveRecord::Migration
  def change
    remove_column :credit_cards, :expires_on, :string
  end
end
