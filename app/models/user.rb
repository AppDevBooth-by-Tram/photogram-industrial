class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :own_photos, class_name: "Photos", foreign_key: "owner_id"
  has_many :followers, class_name: "User", foreign_key: "sender_id"
  has_many :following, class_name: "User", foreign_key: "recipient_id"
  validates :username, presence: true, uniqueness: true
end
