class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :signup?


    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end
    
    def logged_in?
        !!session[:user_id]
    end

   
    def signup?
        !!session[:user_id]
    end 

    # def login(user)
    #     session[:current_user_id] = @user.id  
    # end
end
