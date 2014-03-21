class AddCreditCardToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :credit_card, index: true
  end
end
