class UsersController < ApplicationController

    def index
        if params['user'].nil?
            render json: User.all    
        else
            user = User.find_by(username: params['user']['username'])
            if user.nil?
                render json: User.all
            else
                render json: user
            end
        end
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
        User.update(params[:id], user_param)
    end
    
    def destroy
        render json: User.find(params[:id])
        User.destroy(params[:id])
    end

    private
    def user_param
        params.require(:user).permit(:username)
    end
end