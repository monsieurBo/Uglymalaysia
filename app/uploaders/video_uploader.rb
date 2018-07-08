class VideoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # include CarrierWave::Video
  # process encode_video: [:mp4 ]
  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog
  #
  # DEFAULTS = {
  #   watermark: {
  #     path: Rails.root.join('uglymy.png')
  #   }
  # }

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "https://s3-ap-southeast-1.amazonaws.com/ugly-my-image"
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # process encode_video: [:mp4, resolution: "200x200"]
  # preserve_aspect_ratio: :width
  # preserve_aspect_ratio: :height
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process thumbnail: [{format: 'png', quality: 10, size: 158, strip: true, logger: Rails.logger}]
  #   def full_filename for_file
  #   png_name for_file, version_name
  #   end
  # end

  # def png_name for_file, version_name
  # %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  # end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(mp4 avi mp3)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
