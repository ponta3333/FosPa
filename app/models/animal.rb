class Animal < ApplicationRecord

  has_many :favorites, dependent: :destroy
  belongs_to :bleed
  belongs_to :supply_user

  validates :bleed_id, presence: true
  validates :supply_user_id, presence: true
  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :image, presence: true
  validates :content, presence: true
  validates :animal_status, presence: true

  attachment :image

end
