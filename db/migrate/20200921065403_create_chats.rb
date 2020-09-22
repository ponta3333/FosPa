class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :demand_user_id, null:false
      t.integer :supply_user_id, null:false
      t.text :message, null:false
      t.string :which_from, null:false

      t.timestamps
    end
  end
end
