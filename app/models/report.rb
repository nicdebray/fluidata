class Report < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_mane :text_blocks, :graph_blocks , :kpi_blocks
end
