class ArtworksController < ApplicationController

    def index
        # debugger
        # shared_art =  Artwork.joins(:shared_viewers).where(users: {id: params[:user_id] })
        # artworks = Artwork.where(artist_id: params[:user_id])
        
        # if shared_art.first.id.nil? && artworks.first.id.nil?
        #     render plain: 'no artwork available'
        # elsif shared_art.first.id.nil? 
        #     results = artworks
        # elsif artworks.first.id.nil?
        #     results = shared_art
        # else
        #     results = 
        # end
        
        results = shared_art.or(artworks)
        render json: results
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
