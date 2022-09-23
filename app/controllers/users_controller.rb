class UsersController < ApplicationController
  def create
    if User.find_by_email(user_params[:email])
      render json: {
        error: 'Email exits, try a diffrent one' 
    }, 
      status: :not_acceptable
  else 
    user = User.create(user_params)
    if user.save
      token = issue_token(user)
    render json: {
      error: 'User created successfully!' 
  }, 
    status: :acceptable
  end

  private

  def user_params
    params.permit(:name, :surname, :email, :password)
  end
end
