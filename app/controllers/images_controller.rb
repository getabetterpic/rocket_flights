class ImagesController < ApplicationController
  skip_before_filter :ensure_correct_media_type
  def create
    rocket = Rocket.find(params['rocket']['id'])
    if rocket && params['file']
      image = Image.new(image: params['file'])
      rocket.images << image if image.save
      ap image
    else
      render json: {}, status: :unprocessable_entity and return
    end

    if rocket.save
      render json: {}, status: :created and return
    else
      render json: rocket.errors, status: :unprocessable_entity and return
    end
  end
end
