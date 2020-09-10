class ApplicationController < ActionController::Base
    def home 
        @crib = "This is Home!"
    end 

    private
    def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        end
    end 

    def login(user)
        session[:current_user_id] = @user.id  
    end 
end
