class SessionsController < ApplicationController

    def new 
        render 'new'
    end 

    def create 
        @user = User.find_by(:email => params[:email])
        if @user 
            login(@user)
            redirect_to '/'
        else
            redirect_to "/login"
        end 
    end 

    def destroy
        session.delete :user
        redirect_to '/'
    end 
end
