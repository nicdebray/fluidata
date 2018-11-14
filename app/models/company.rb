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

  def call_ga_v4
    # Set the date range - this is always required for report requests
    date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(
      start_date: "2018-01-01",
      end_date: "2018-06-30"
      )
# Set the metric
metric = Google::Apis::AnalyticsreportingV4::Metric.new(
  expression: "ga:users"
  )
# Set the dimension
dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(
  name: "ga:browser"
  )
# Build up our report request and a add country filter
report_request = Google::Apis::AnalyticsreportingV4::ReportRequest.new(
  view_id: '179537367',
  sampling_level: 'DEFAULT',
  filters_expression: "ga:country==United Kingdom",
  date_ranges: [date_range],
  metrics: [metric],
  dimensions: [dimension]
  )
# Create a new report request
request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
  { report_requests: [report_request] }
  )
# Make API call.
response = $google_client.batch_get_reports(request)

end

end
