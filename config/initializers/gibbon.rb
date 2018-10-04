MAIL_CHIMP_API_KEY = ENV.fetch('MAIL_CHIMP_API')
Gibbon::Request.api_key = MAIL_CHIMP_API_KEY
Gibbon::Request.timeout = 15
Gibbon::Request.open_timeout = 15