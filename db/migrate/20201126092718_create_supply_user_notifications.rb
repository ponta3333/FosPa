class CreateSupplyUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :supply_user_notifications do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :chat_id, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
