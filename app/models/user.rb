class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # validates :first_name, :last_name, :department, presence: true
  has_one :company
  has_many :reports


 # validates :department, inclusion: { in: %w(Management, Finance, IT, HR, Production, Marketing, R&D, Sales, Purchase) }

 # validates :department, inclusion: %w(Management, Finance, IT, HR, Production, Marketing, R&D, Sales, Purchase)

end
