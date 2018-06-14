class Article < ApplicationRecord
  mount_uploader :image, ArticleUploader
  belongs_to :user

end
