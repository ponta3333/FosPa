class Event < ApplicationRecord

	belongs_to :supply_user

  validates :supply_user_id, presence: true
  validates :name, presence: true
  validates :day, presence: true
  validates :place, presence: true
  validates :image, presence: true
  validates :content, presence: true

  attachment :image

end
