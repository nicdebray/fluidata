class GraphBlock < ApplicationRecord
  belongs_to :report
  validates :graph_type, presence: true
  validates :order, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
