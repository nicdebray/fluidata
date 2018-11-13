class Report < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_many :text_blocks, :graph_blocks , :kpi_blocks
end
