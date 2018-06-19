class Article < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy
	
	mount_uploaders :images, ImageUploader
end
