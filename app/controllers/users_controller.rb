class UsersController < ApplicationController
  # before_action :authenticate, except: [:login, :create]

  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      render json: {status: 201, user: user}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

end
