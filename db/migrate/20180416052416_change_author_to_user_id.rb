class ChangeAuthorToUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :gifs, :author
  end
end
