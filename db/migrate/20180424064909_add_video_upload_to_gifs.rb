class AddVideoUploadToGifs < ActiveRecord::Migration[5.1]
  def change
    add_column :gifs, :video_upload, :string
  end
end
