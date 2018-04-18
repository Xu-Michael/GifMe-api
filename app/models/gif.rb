class Gif < ApplicationRecord

  HOST = Rails.env.production? ? "https://gifme-api.wogengapp.cn" : "http://localhost:3000"
  PATH = "saved_gifs"

  has_many :collections
  belongs_to :user
  acts_as_taggable_on :tags

  def collection_count
    Collection.where(gif_id: id).count
  end

  def user_name
    user.name
  end

  def user_avatar
    user.avatar
  end

  def convert!
    `ffmpeg -i #{video} -filter_complex "fps=10,scale=-1:320,crop=ih:ih,setsar=1,palettegen" #{palette_path}`
    `ffmpeg -i #{video} -i #{palette_path} -filter_complex "[0]fps=10,scale=-1:340,crop=ih:ih,setsar=1[x];[x][1:v]paletteuse" #{gif_path}`
  end


  def palette_path
    "public/#{PATH}/palette#{id}.png"
  end

  def gif_path
    "public/#{PATH}/#{id}.gif"
  end

  def gif_url
    "#{HOST}/#{PATH}/#{id}.gif"
  end


end
