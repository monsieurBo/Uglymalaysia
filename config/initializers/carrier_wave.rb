CarrierWave.configure do |config|
  require 'carrierwave/orm/activerecord'

	if Rails.env.development? or Rails.env.test?
		config.storage = :file
	else
		config.fog_credentials = {
			:provider               => 'AWS',
			:aws_access_key_id      => '<access key>',
			:aws_secret_access_key  => '<secrect acess key >'
		}
		config.fog_directory  = "<name of your bucket>"
		config.cache_dir = "#{Rails.root}/tmp/uploads"
	end
end
