require 'yaml'
require 'rspotify'

namespace :db do
  namespace :seed do
    desc 'Get data from the Spotify API according to the /db/seeds/artists_list.yml file'
    task :import_spotify_data => :environment do
      import_api_data
    end
  end
end
  
def import_api_data
  artists = YAML.load_file(Rails.root.join('db/seeds/artists_list.yml')).values.flatten
  artists.each do |name_artist|
    sleep(0.3)
    artist = RSpotify::Artist.search(name_artist.to_s).first
    begin
      create_api_data(artist)
    #rescue RestClient::TooManyRequests => e
      #sleep(0.3)
    end
  end
end
  
def create_api_data(artist)
  new_artist = Artist.new(name: artist.name,
                          image: artist.images.first["url"],
                          genres: artist.genres,
                          popularity: artist.popularity,
                          spotify_url: artist.external_urls["spotify"],
                          spotify_id: artist.id)
  if new_artist.save
    artist.albums.each do |album|
      new_album = Album.new(name: album.name,
                            image: album.images.empty? ? 'no_image' : album.images.first["url"],
                            spotify_url: album.external_urls["spotify"],
                            total_tracks: album.total_tracks,
                            spotify_id: album.id,
                            artist_id: new_artist.id)
      if new_album.save
        album.tracks.each do |song|
          new_song = Song.new(name: song.name,
                              spotify_url: song.external_urls["spotify"],
                              preview_url: song.preview_url,
                              duration_ms: song.duration_ms,
                              explicit: song.explicit,
                              spotify_id: song.id,
                              album_id: new_album.id)
          new_song.save  
        end
      end
    end
  end
end