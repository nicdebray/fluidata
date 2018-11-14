# Create a Google Analytics Reporting service
service = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new

# Create service account credentials
credentials = Google::Auth::ServiceAccountCredentials.make_creds(
  json_key_io: File.open('service_account_cred.json'),
  scope: 'https://www.googleapis.com/auth/analytics.readonly'
  )

# Authorize with our readonly credentials
service.authorization = credentials

$google_client = service
