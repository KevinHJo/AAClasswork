class Api::SessionsController < ApplicationController

    before_action :require_login , only: [:destroy]

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            render 'api/users/show'
        else
            render json: ["invalid email and password"]
        end
    end

    def destroy
        if logged_in?
            logout!
            render json: [{}]
        else
            render json: ["no current user"] ,status: 404
        end
    end
end
