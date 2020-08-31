class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :seller, :boolean
    add_column :users, :lat, :float
    add_column :users, :long, :float
  end
end
