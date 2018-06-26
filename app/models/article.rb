class Article < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy
	is_impressionable
	acts_as_taggable_on :tags
	mount_uploaders :images, ImageUploader
	mount_uploaders :videos, VideoUploader
end
