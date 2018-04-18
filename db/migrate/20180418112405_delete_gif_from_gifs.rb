class DeleteGifFromGifs < ActiveRecord::Migration[5.1]
  def change
    remove_column :gifs, :gif
  end
end
