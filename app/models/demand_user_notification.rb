class DemandUserNotification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :demand_user, optional: true
  belongs_to :supply_user, optional: true
  belongs_to :chats, optional: true

end
