class Bleed < ApplicationRecord

	has_many :animals, dependent: :destroy
	belongs_to :genre

  validates :genre_id, presence: true
  validates :name, presence: true

end
