class AlbumsController < ApplicationController
    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def new
        @bands = Band.all.sort
        @band_id = params[:band_id]
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            render :new
        end
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :live?, :band_id)
    end
end