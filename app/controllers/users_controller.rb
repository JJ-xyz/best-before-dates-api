class UsersController < ApplicationController
  # before_action :authenticate, except: [:login, :create]

  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.username)
      render json: {status: 201, user: user}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end






private

  def token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
    {
      exp: (Time.now + 1.day).to_i # Expiration date 24 hours from now
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
  end


end
