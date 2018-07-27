module ArticlesHelper
  def get_tags
    ActsAsTaggableOn::Tag.order(:name).map(&:name)
  end
end
