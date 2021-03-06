class UsersController < ApplicationController
  before_action :authenticate, except: [:login, :create]

  def login
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate( user_params[:password])
      token = token(user.id, user.username)
      render json: {status: 201, token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def create
     user = User.new(user_params)
     if user.save
       render json: {status: 200, message: "ok"}
     else
       render json: {status: 422, user: user.errors}
     end
   end

   def show
     user = User.find(params[:id])

     render json: {status: 200, user: user}
   end





  private

    def token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
  end


  def user_params
     params.required(:user).permit(:username, :password, :household_id)
  end

end
