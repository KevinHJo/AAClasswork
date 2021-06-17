class CommentsController < ApplicationController
    def index
        render json: Comment.all
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