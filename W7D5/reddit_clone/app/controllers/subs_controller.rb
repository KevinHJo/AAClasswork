class SubsController < ApplicationController
    before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_moderator, only: [:edit, :update, :destroy]


    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
        
    end

    def edit
        render :edit
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def update  
       if @sub.update_atributes(sub_params)
            redirect_to sub_url(@sub)
       else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
       end
    end

    def destroy
        @sub.destroy
        redirect_to subs_url
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
