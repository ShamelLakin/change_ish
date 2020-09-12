class SessionsController < ApplicationController

    def new 
        render 'new'
    end 

    def create 
        # @user = User.find_by(:email => params[:email])
        # if @user 
        #     login(@user)
        #     redirect_to '/'
        # else
        #     redirect_to "/login"
        # end 
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
       
          session[:user_id] = @user.id
       
          render 'home/index'
    end 

    def destroy
        session.delete :user
        redirect_to '/'
    end 

    private 
    def auth
        request.env['omniauth.auth']
      end
end
