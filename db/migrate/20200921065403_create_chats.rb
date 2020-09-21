class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :demand_user_id
      t.integer :supply_user_id
      t.text :message
      t.string :which_from

      t.timestamps
    end
  end
end
