class Report < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :text_blocks
  has_many :graph_blocks
  has_many :kpi_blocks
end
