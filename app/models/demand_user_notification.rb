class DemandUserNotification < ApplicationRecord
  default_scope -> { order(creates_at: :desc) }
  belongs_to :demand_user
  belongs_to :supply_user
  belongs_to :chats

end
