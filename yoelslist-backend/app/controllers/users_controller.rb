class UsersController < ApplicationController
    skip_before_action :authorized, only: [:auto_login, :index, :create]

      def index
        @users = User.all
        render json: @users
      end

      def create
        user = User.create(user_params)
       
        if user.valid?
          render json: { user: user, status: :created}
        else
          render json: { error: 'failed to create user', status: :not_acceptable}
        end
      end
    
    private
      
      def user_params
        params.require(:user).permit(:email, :password)
      end
end
