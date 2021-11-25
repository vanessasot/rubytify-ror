class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true
  validates :image, presence: true
  validates :spotify_url, presence: true
  validates :total_tracks, presence: true
  validates :spotify_id, presence: true

  def self.new_spotify_album(spotify_album)
    Album.new(
      spotify_id: spotify_album.id,
      name: spotify_album.name,
      image: spotify_album.album.images[0]["url"],
      spotify_url: spotify_album.spotify_url,
      total_tracks: spotify_album.total_tracks
    )
  end

  def self.create_spotify_album(spotify_album)
    album = self.new_spotify_album(spotify_album)
    album.save
    album
  end
end
