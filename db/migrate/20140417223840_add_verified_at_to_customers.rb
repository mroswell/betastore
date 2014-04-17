class AddVerifiedAtToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :verified_at, :timestamp
  end
end
