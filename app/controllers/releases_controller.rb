class ReleasesController < ApplicationController
    def index
        @artist = Artist.find(params[:artist_id])
        @releases = @artist.releases
    end

    def show
        @artist = Artist.find(params[:artist_id])
        @release = @artist.releases.find(params[:id])
    end

    def new
        @artist = Artist.find(params[:artist_id])
        @release = Release.new(artist: @artist)
      end
    
    def create
        @release = Release.new(release_params)
        @artist = Artist.find(params[:artist_id])
        @release.artist = @artist
    
        if @release.save
          redirect_to artist_release_url(artist_id: @artist.id, id: @release.id), notice: 'Release was successfully created.'
        else
          render :new
        end
    end
    
    def edit 
        @artist = Artist.find(params[:artist_id])
        @release = Release.find(params[:id])
        render :edit
    end

    def update
        @artist = Artist.find(params[:artist_id])
        @release = Release.find(params[:id])

        if @release.update(release_params)
            redirect_to artist_release_url(artist_id: @artist.id, id: @release.id), notice: 'Release was sucessfully update'
        else
            render :edit
        end
    end

    def destroy
        @artist = Artist.find(params[:artist_id])
        @release = Release.find(params[:id])
    
        @release.destroy
    
        redirect_to artist_releases_url, notice: 'Release was successfully destroyed.'
    end

    private 
    
    def release_params #função utilizada somente pela class
        params.require(:release).permit(
          :title
        )
    end
end

    