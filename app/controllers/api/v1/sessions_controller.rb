class Api::V1::SessionsController < ApplicationController
  before_action :load_user, only: :create

  def create
    # user sign in 
    if @user.password == params[:password]
      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        data: {token: @user.authentication_token}
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private
  def load_user
    @user = User.find_by(email: params[:email])
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end
end
