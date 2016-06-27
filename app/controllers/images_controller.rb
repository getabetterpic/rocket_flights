class ImagesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :delete]
  skip_before_filter :ensure_correct_media_type, only: [:create]

  def create
    rocket = Rocket.find(params['rocket_id'])
    if rocket && params['file']
      image = Image.new(image: params['file'])
      rocket.images << image if image.save
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
