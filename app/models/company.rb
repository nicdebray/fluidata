class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :vat, presence: true, uniqueness: true
end
