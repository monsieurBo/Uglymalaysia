class Article < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy
	is_impressionable

	mount_uploaders :images, ImageUploader
end
