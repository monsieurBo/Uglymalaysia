class Article < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy
	is_impressionable
	acts_as_taggable_on :tags
	# scope :by_join_date, order("created_at DESC")



	mount_uploaders :images, ImageUploader
	mount_uploaders :videos, VideoUploader
end
