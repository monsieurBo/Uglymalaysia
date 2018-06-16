class Article < ApplicationRecord
	mount_uploaders :images, ImageUploader
end
