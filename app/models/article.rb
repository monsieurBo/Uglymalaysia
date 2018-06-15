class Article < ApplicationRecord
  attr_accessor :file
  mount_uploader :image, ArticleUploader
  serialize :avatars, JSON
  belongs_to :user

end
