class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end

    end

    def show
        @user = User.find_by(id: params[:id])
        # if @user
        render :show
        # else
        #     render json: @user.errors.full_messages, status: 404
        # end
    end



    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    
end
