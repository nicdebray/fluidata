class KpiBlock < ApplicationRecord
  belongs_to :report
  validates :kpi_type, presence: true, uniqueness: true
  validates :order, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
