class Api::V1::RegistrationsController < ApplicationController
  
  before_action :ensure_params_exist, only: :create
  
  def create
    # user sign up
    user = User.new(email: user_params["email"])
    user.password = user_params["password"]
    if user.save
      authentication_token = encode_token({user_id: user.id})
      user.update_attributes(authentication_token: authentication_token)
      render json: {
        messages: "Sign Up Successfully",
        is_success: true,
        data: {user: user}
      }, status: :ok
    else
      render json: {
        messages: "Sign Up Failded",
        is_success: false,
        data: {error: user.errors.full_messages.to_sentence}
      }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
      }, status: :bad_request
  end
end