class DemandUserNotification < ApplicationRecord

  belongs_to :demand_user
  belongs_to :supply_user
  belongs_to :chats

end
