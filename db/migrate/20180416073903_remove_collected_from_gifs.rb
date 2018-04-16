class RemoveCollectedFromGifs < ActiveRecord::Migration[5.1]
  def change
    remove_column :gifs, :collected
  end
end
