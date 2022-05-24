class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :assign_default_role

  has_one_attached :avatar

  def assign_default_role
    self.role == 'author' if self.role.blank?
  end
end
