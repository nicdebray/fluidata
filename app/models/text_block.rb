class TextBlock < ApplicationRecord
  belongs_to :report
  validates :content, presence: true

end
