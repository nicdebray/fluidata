class KpiBlock < ApplicationRecord
  belongs_to :report
  validates :kpi_type, presence: true
  validates :order, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def call_ga_v4
    # Set the date range - this is always required for report requests
    date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(
      start_date: start_date,
      end_date: end_date
      )
    # Set the metric
    metric = Google::Apis::AnalyticsreportingV4::Metric.new(
      expression: kpi_type
      )
    # Build up our report request and a add country filter
    report_request = Google::Apis::AnalyticsreportingV4::ReportRequest.new(
      view_id: '179537367',
      sampling_level: 'DEFAULT',
      date_ranges: [date_range],
      metrics: [metric]
      )
    # Create a new report request
    request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
      { report_requests: [report_request] }
      )
    # Make API call.
    response = $google_client.batch_get_reports(request)
  end
end














