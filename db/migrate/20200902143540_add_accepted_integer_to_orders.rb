class AddAcceptedIntegerToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :accepted, :integer
  end
end
