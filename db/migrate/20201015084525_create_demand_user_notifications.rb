class CreateDemandUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :demand_user_notifications do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :chat_id, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
