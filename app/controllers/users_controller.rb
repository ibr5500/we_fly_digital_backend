class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :surname, :email, :password)
  end
end



#     if User.find_by_email(user_params[:email])
#       render json: {
#         error: 'Email exits, try a diffrent one' 
#     }, 
#       status: :not_acceptable
#   else 
#     user = User.create(user_params)
#     if user.save
#       token = issue_token(user)
#     render json: {
#       error: 'User created successfully!' 
#   }, 
#     status: :acceptable
#   end


# end
