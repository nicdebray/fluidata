class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # validates :first_name, :last_name, :department, presence: true

  has_one :company
  has_many :reports

  mount_uploader :avatar, PhotoUploader
end
