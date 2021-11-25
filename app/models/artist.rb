class Artist < ApplicationRecord
    has_many :songs
    has_many :albums

    validates :name, presence: true
    validates :image, presence: true
    validates :genres, presence: true
    validates :popularity, presence: true
    validates :spotify_url, presence: true
    validates :spotify_id, presence: true

end
