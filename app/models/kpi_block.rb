class KpiBlock < ApplicationRecord
  belongs_to :report
  validates :kpi_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def call_ga_v4_kpi
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

  def self.items_hash
   {
      "Users" => "ga:users",
      "New Users" => "ga:newUsers",
      "% New Sessions" => "ga:percentNewSessions",
      "1 Day Active Users" => "ga:1dayUsers",
      "7 Day Active Users" => "ga:7dayUsers",
      "14 Day Active Users" => "ga:14dayUsers",
      "28 Day Active Users" => "ga:28dayUsers",
      "30 Day Active Users" => "ga:30dayUsers",
      "Number of Sessions per User" => "ga:sessionsPerUser",
      "Sessions" => "ga:sessions",
      "Bounces" => "ga:bounces",
      "Bounce Rate" => "ga:bounceRate",
      "Session Duration" => "ga:sessionDuration",
      "Avg. Session Duration" => "ga:avgSessionDuration",
      "Unique Dimension Combinations" => "ga:uniqueDimensionCombinations",
      "Hits" => "ga:hits",
      "Organic Searches" => "ga:organicSearches",
      "Impressions" => "ga:impressions",
      "Clicks" => "ga:adClicks",
      "Cost" => "ga:adCost",
      "CPM" => "ga:CPM",
      "CPC" => "ga:CPC",
      "CTR" => "ga:CTR",
      "Cost per Transaction" => "ga:costPerTransaction",
      "Cost per Goal Conversion" => "ga:costPerGoalConversion",
      "Cost per Conversion" => "ga:costPerConversion",
      "RPC" => "ga:RPC",
      "ROAS" => "ga:ROAS",
      "Goal XX Starts" => "ga:goalXXStarts",
      "Goal Starts" => "ga:goalStartsAll",
      "Goal XX Completions" => "ga:goalXXCompletions",
      "Goal Completions" => "ga:goalCompletionsAll",
      "Goal XX Value" => "ga:goalXXValue",
      "Goal Value" => "ga:goalValueAll",
      "Per Session Goal Value" => "ga:goalValuePerSession",
      "Goal XX Conversion Rate" => "ga:goalXXConversionRate",
      "Goal Conversion Rate" => "ga:goalConversionRateAll",
      "Goal XX Abandoned Funnels" => "ga:goalXXAbandons",
      "Abandoned Funnels" => "ga:goalAbandonsAll",
      "Goal XX Abandonment Rate" => "ga:goalXXAbandonRate",
      "Total Abandonment Rate" => "ga:goalAbandonRateAll",
      "Page Value" => "ga:pageValue",
      "Entrances" => "ga:entrances",
      "Entrances / Pageviews" => "ga:entranceRate",
      "Pageviews" => "ga:pageviews",
      "Pages / Session" => "ga:pageviewsPerSession",
      "Unique Pageviews" => "ga:uniquePageviews",
      "Time on Page" => "ga:timeOnPage",
      "Avg. Time on Page" => "ga:avgTimeOnPage",
      "Exits" => "ga:exits",
      "% Exit" => "ga:exitRate",
      "Results Pageviews" => "ga:searchResultViews",
      "Total Unique Searches" => "ga:searchUniques",
      "Results Pageviews / Search" => "ga:avgSearchResultViews",
      "Sessions with Search" => "ga:searchSessions",
      "% Sessions with Search" => "ga:percentSessionsWithSearch",
      "Search Depth" => "ga:searchDepth",
      "Avg. Search Depth" => "ga:avgSearchDepth",
      "Search Refinements" => "ga:searchRefinements",
      "% Search Refinements" => "ga:percentSearchRefinements",
      "Time after Search" => "ga:searchDuration",
      "Time after Search" => "ga:avgSearchDuration",
      "Search Exits" => "ga:searchExits",
      "% Search Exits" => "ga:searchExitRate",
      "Site Search Goal XX Conversion Rate" => "ga:searchGoalXXConversionRate",
      "Site Search Goal Conversion Rate" => "ga:searchGoalConversionRateAll",
      "Per Search Goal Value" => "ga:goalValueAllPerSearch",
      "User Timing (ms)" => "ga:userTimingValue",
      "User Timing Sample" => "ga:userTimingSample",
      "Avg. User Timing (sec)" => "ga:avgUserTimingValue"
    }
  end
end



