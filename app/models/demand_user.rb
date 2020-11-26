class DemandUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :demand_user_notifications, foreign_key: 'receiver_id', dependent: :destroy
  has_many :demand_user_notifications, foreign_key: 'sender_id', dependent: :destroy

  enum job: {会社員: 0, 公務員: 1, 自営業: 2, 専門職: 3, 学生: 4, 専業主婦: 5, "パート・アルバイト": 6, 無職: 7, その他: 8}
  enum age: {"10代": 0, "20代": 1, "30代": 2, "40代": 3, "50代": 4, "60代": 5, "70歳以上": 6}
  enum is_deleted: { 有効: false, 退会済み: true }

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :job, presence: true
  validates :age, presence: true
  validates :nickname, presence: true
  validates :phone, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted === "有効")
  end

end
