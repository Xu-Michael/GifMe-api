class AddWxIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wx_id, :string
  end
end
