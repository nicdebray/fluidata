class TextBlock < ApplicationRecord
  belongs_to :report
  validates :content, presence: true
  validates :order, presence: true, uniqueness: true
end
