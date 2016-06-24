class UserManagementController < ApplicationController
  before_action :set_user, :check_auth_key
  skip_before_filter :ensure_correct_media_type

  def update
    status = @user.new_record? ? :created : :ok
    if @user.save
      render json: {}, status: status
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_or_initialize_by(auth0_user_id: user_params[:auth0_user_id])
    @user.email = user_params[:email]
  end

  def user_params
    clean_params = params['identity'].select { |k, v| ['user_id', 'email'].include?(k) }
    { auth0_user_id: clean_params['user_id'], email: clean_params['email'] }
  end

  def check_auth_key
    unless params[:auth] == ENV['DEV_SECRET']
      render json: {}, status: :unauthorized and return
    end
  end
end
