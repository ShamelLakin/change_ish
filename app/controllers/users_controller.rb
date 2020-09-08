class UsersController < ApplicationController

    def index
    end 

    #GET /signup - new User action
    def new 
        @user = User.new
    end 

    #POST /users - create the User action
    def create 
         @user = User.new
         @user.email = params[:email]
         @user.save
         redirect_to articles_path(@article)
    end
end
