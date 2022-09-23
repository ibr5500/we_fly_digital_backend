class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
       render json: {
            user: @users.first
        }
    end
end
