Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_client_id'], ENV['google_secret'],skip_jwt: true
  provider :twitter, ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_SECRET']
end

