class SupplyUserNotification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :demand_user, foreign_key: 'sender_id', optional: true
  belongs_to :supply_user, foreign_key: 'receiver_id', optional: true
  belongs_to :chats, optional: true

  
end
