class UsersController < ApplicationController
  def index
    @users = User.all
    render json: { user: @users }
  end

  def create
    if User.find_by(username: user_params[:username].to_s.downcase)
      render json: { error: 'Username exits, try a diffrent one' }, status: :not_acceptable
    else
      @user = User.create(user_params)
      @user.username = @user.username.downcase

      if @user.valid?
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, 
        status: :unprocessable_entity
      end
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password)
  end
end
