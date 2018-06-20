Recaptcha.configure do |config|
  config.site_key  = ENV['CAPTCHA_ID']
  config.secret_key = ENV['CAPTCHA_SECRET']
end
