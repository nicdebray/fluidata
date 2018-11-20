class Report < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :text_blocks, dependent: :destroy
  has_many :graph_blocks, dependent: :destroy
  has_many :kpi_blocks, dependent: :destroy
end
