class LikesController < ApplicationController

    def index
        if params['comment'].nil? && params['artwork'].nil?
            render plain: 'error'
        elsif params['comment'].nil?
            likes = Like.where(likeable_type: 'Artwork').where(likeable_id: params['artwork']['id'])
            render json: likes
        else
            likes = Like.where(likeable_type: 'Comment').where(likeable_id: params['comment']['id'])
            render json: likes            
        end
    end

    def create
        like = Like.new(like_params)
        if like.save!
            render json: like
        else
            render json: like.errors.full_messages, status: 422
        end
    end

    def destroy
        render json: Like.find(params[:id])
        Like.destroy(params[:id])
    end

    private
    def like_params
        params.require(:like).permit(:likeable_type, :likeable_id, :author_id)
    end
end