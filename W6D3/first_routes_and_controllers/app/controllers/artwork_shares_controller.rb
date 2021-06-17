class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(artwork_shares_params)

        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        render json: ArtworkShare.find(params[:id])
        ArtworkShare.destroy(params[:id])
    end
    
    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end