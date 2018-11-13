#Inclusion du client Google
# require 'google/api_client'
# require 'googleauth'
require 'google/apis/analytics_v3'

class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :vat, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

  def self.call_ga
    ganalytics = Google::Apis::AnalyticsV3
    analytics = ganalytics::AnalyticsService.new

    analytics.authorization = ENV['GOOGLE_OUR_SECRET'] #user.token

    #run a query
    date_range = ganalytics::GaData::Query.new(start_date: '7DaysAgo', end_date: 'today')
    metric = Google::Apis::AnalyticsV3::GaData::Query.new(metrics: 'ga:sessions')
    dimension = Google::Apis::AnalyticsV3::GaData::Query.new(dimensions: 'ga:browser')

    request = Google::Apis::AnalyticsreportingV3::GetReportsRequest.new(
      report_requests: [Google::Apis::AnalyticsreportingV3::ReportRequest.new(
        view_id: '179537367',
        metrics: 'ga:sessions',
        dimensions: 'ga:browser',
        date_ranges: [{start_date: '7DaysAgo', end_date: 'today'}]
        )]
      )

    # response = analytics.batch_get_reports(request)
    # response.reports
  end
end
