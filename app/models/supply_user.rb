class SupplyUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :chats, dependent: :destroy
  has_many :animals, dependent: :destroy
  has_many :events, dependent: :destroy

  enum is_deleted: { 有効: false, 退会済み: true }

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

def active_for_authentication?
  super && (self.is_deleted === "有効")
end

end
