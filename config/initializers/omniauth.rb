Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_client_id'], ENV['google_secret'],skip_jwt: true
  provider :twitter, ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_SECRET']
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV["FACEBOOK_SECRET_ID"], scope: 'public_profile', info_fields: 'id,name,link'

 #  Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :facebook, Rails.application.secrets.facebook_app_id,
 # Rails.application.secrets.facebook_app_secret, scope: ‘public_profile’, info_fields: ‘id,name,link’
end
