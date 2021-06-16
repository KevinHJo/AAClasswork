class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        user = User.new(user_param)
        # debugger
        if user.save!
            render json: user
        else
            render json: user.error.full_messages , status: 422
        end

        # render json: user_param
    end

    def show
        render json: User.find(params[:id])
    end
    
    def update
        User.update(params[:id], params.require(:user).permit(:username))
    end
    
    def destroy
        User.destroy(params[:id])
    end

    def user_param
        params.require(:user).permit(:username)
    end
end