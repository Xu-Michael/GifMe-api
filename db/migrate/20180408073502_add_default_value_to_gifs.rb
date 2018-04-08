class AddDefaultValueToGifs < ActiveRecord::Migration[5.1]
  def change
    change_column_default :gifs, :collected, from: nil, to: 0
  end
end
