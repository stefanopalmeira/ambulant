class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :accepted, :boolean
  end
end
