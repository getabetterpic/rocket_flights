class ImagesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :delete]
  skip_before_filter :ensure_correct_media_type, only: [:create]

  def create
    rocket = Rocket.find(params['rocket_id'])
    if rocket && params['file']
      image = Image.new(image: params['file'])
      rocket.add_image(image) if image.save
    else
      render json: {}, status: :unprocessable_entity and return
    end

    if rocket.save
      image_serializer = JSONAPI::ResourceSerializer.new(ImageResource)
      image_serialized = image_serializer.serialize_to_hash(ImageResource.new(image, nil))
      render json: image_serialized, status: :created and return
    else
      rocket_serializer = JSONAPI::ResourceSerializer.new(RocketResource)
      rocket_seralized = rocket_serializer.serialize_to_hash(RocketResource.new(rocket, nil))
      render json: rocket_seralized, status: :unprocessable_entity and return
    end
  end
end
