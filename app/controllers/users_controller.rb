class UsersController < ApplicationController
  before_action :authenticate, only: [:index]

  def index
    user_serializer = JSONAPI::ResourceSerializer.new(UserResource)
    current_user_seralized = user_serializer.serialize_to_hash(UserResource.new(current_user, nil))
    render json: current_user_seralized, status: :ok
  end
end
