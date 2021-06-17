class AddTimestampstoArtwork < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:artworks)
  end
end
