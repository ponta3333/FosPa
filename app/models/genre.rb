class Genre < ApplicationRecord

	has_many :bleeds, dependent: :destroy

  validates :name, presence: true

end
