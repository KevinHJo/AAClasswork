class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.is_password?(params[:user][:password])
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end 
    end

    def destroy
        logout!
        redirect_to new_session_url
    end


end
