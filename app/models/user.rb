class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :entities, dependent: :delete_all
  has_many :groups, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 100, minimum: 3 }
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }
end
