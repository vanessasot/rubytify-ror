class Api::V1::AlbumsController < ApplicationController
  
  def index
    @albums = Artist.find(params[:artist_id]).albums
    render json: @albums, root: 'data',each_serializer: AlbumSerializer, adapter: :json
  end

end
