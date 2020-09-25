class SessionsController < ApplicationController

    def new 
        render 'new'
    end 

    def create 
       if auth != nil
        # binding.pry
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.password = SecureRandom.hex
            end
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.find_by(:email => params[:email])
           if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to '/'
            else
                render "new"
            end
        end 
    end 

    def destroy
        session.clear
        redirect_to '/'
    end 

    private 
    
    def auth
        request.env['omniauth.auth']
      end
end
