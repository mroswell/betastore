class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :expires_on
      t.belongs_to :customer

      t.timestamps
    end
  end
end
