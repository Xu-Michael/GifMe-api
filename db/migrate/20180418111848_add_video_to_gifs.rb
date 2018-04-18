class AddVideoToGifs < ActiveRecord::Migration[5.1]
  def change
    add_column :gifs, :video, :string
  end
end
