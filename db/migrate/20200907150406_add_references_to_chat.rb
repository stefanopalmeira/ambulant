class AddReferencesToChat < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :sender, foreign_key: { to_table: :users }
    add_reference :chats, :recipient, foreign_key: { to_table: :users }
  end
end
