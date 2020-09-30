class ApplicationController < ActionController::API
	
	def encode_token(payload)
    # encode token 
		JWT.encode(payload, 's3cr3t')
	end

  def authenticate_user!
    # authenciate user by token send in the headers in the api
  	token = request.headers['token']
    unless User.find_by(authentication_token: token).present?
    	render json: { message: 'Please log in' }, status: :unauthorized 
    end
  end

  def current_user
    # find current user based on token
    token = request.headers['token']
    user = User.find_by(authentication_token: token)
  end

end
