class AddReferenceToChat < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :order, foreign_key: { to_table: :orders }
  end
end
