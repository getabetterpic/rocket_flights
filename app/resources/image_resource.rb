class ImageResource < JSONAPI::Resource
  attributes :image_url, :image_file_name

  def image_url
    @model.image.url
  end
end
