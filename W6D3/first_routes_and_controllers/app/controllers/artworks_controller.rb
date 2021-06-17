class ArtworksController < ApplicationController

    def index
        render json: Artwork.find_by(artist_id: params[:user_id])
    end

    def create
        artwork = Artwork.new(artwork_param)
        if artwork.save!
            render json: artwork
        else
            render json: artwork.error.full_messages, status: 422
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end
    
    def update
        Artwork.update(params[:id], artwork_param)
    end
    
    def destroy
        # render json: Artwork.find(params[:id])
        show
        Artwork.destroy(params[:id])
    end

    private
    def artwork_param
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end