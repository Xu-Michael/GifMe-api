class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :tags
      t.string :image
      t.string :author
      t.integer :collected

      t.timestamps
    end
  end
end
