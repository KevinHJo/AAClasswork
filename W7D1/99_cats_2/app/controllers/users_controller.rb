class UsersController < ApplicationController
    attr_reader :password

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        byebug
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
