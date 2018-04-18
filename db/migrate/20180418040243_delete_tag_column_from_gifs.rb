class DeleteTagColumnFromGifs < ActiveRecord::Migration[5.1]
  def change
    remove_column :gifs, :tags
  end
end
