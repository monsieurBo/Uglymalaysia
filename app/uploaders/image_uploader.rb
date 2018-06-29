class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

    "https://s3-ap-southeast-1.amazonaws.com/ugly-my-image/default-avatar-2.jpg"
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
def process_original_version
        image = ::MiniMagick::Image::read(File.binread(@file.file))

        if image[:width] > image[:height]
            resize_to_fill 1600, 1200
        else
            resize_to_fill 1200, 1600
        end
    end

  version :full do
     process :resize_to_fill => [1200, 800]
  end

  version :large, :from_version => :full do
     process :resize_to_fit => [800, 600]
  end

  version :medium, :from_version => :full do
     process :resize_to_fit => [600, 400]
  end

  version :large_thumb, :from_version => :full do
     process :resize_to_fit => [300, 300]
  end

  version :thumb, :from_version => :large_thumb do
     process :resize_to_fit => [150, 150]
  end

  version :mini_thumb, :from_version => :thumb do
    process :resize_to_fit => [30,30]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
