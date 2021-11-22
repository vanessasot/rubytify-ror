class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :spotify_url
      t.string :preview_url
      t.integer :duration_ms
      t.boolean :explicit
      t.string :spotify_id
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
