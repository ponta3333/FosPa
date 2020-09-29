class Animal < ApplicationRecord

  has_many :favorites, dependent: :destroy
  belongs_to :bleed
  belongs_to :supply_user
  enum sex: {オス: 0, メス: 1}
  enum age: {"1歳未満": 0, "1~3歳未満": 1, "3~5歳未満": 2, "5~7歳未満": 3, "7歳以上": 4}
  validates :bleed_id, presence: true
  validates :supply_user_id, presence: true
  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :image, presence: true
  validates :content, presence: true

  attachment :image

end
