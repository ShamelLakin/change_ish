class UsersController < ApplicationController

    def index
    end 
    
    def show 
    end

    def create
        User.create(user_params)
      end
     
      private
     
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    
end
