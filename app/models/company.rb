#Inclusion du client Google
# require 'google/api_client'
# require 'googleauth'
# require 'google/apis/analytics_v3'

class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :vat, presence: true, uniqueness: true

  has_one :user

  mount_uploader :photo, PhotoUploader
end
