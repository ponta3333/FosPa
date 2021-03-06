class Chat < ApplicationRecord

	belongs_to :demand_user
	belongs_to :supply_user
  has_many :demand_user_notifications, dependent: :destroy
  has_many :supply_user_notifications, dependent: :destroy

  validates :demand_user_id, presence: true
  validates :supply_user_id, presence: true
  validates :message, presence: true
  validates :which_from, presence: true

end
