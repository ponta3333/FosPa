class Favorite < ApplicationRecord

	belongs_to :demand_user
	belongs_to :animal

  validates :demand_user_id, presence: true
  validates :animal_id, presence: true

end
