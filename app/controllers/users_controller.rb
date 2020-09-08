class UsersController < ApplicationController

    def index
    end 

    #GET /signup - new User action
    def new 
        @user = User.new
    end 

    #POST /users - create the User action
    def create 
        binding.pry
         @user = User.new
         @user.email = params([:name, :email])
         @user.save
         redirect_to article_path(@article)
    end
end
