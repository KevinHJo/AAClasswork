class CommentsController < ApplicationController
    
    def index

        if params['user'].nil? && params['artwork'].nil?
            render plain: 'error'
        elsif params['user'].nil?
            comment = Comment.where(artwork_id: params['artwork']['id'])
            render json: comment
        else
            comment = Comment.where(author_id: params['user']['id'])
            render json: comment            
        end
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save!
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        render json: Comment.find(params[:id])
        Comment.destroy(params[:id])
    end

    private
    def comment_params
        params.require(:comment).permit(:author_id, :body, :artwork_id)
    end
end