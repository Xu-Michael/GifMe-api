require 'qiniu'
require 'pry-byebug'

class Gif < ApplicationRecord

  HOST = Rails.env.production? ? "https://gifme-api.wogengapp.cn" : "http://localhost:3000"
  PATH = "saved_gifs"

  has_many :collections
  belongs_to :user
  acts_as_taggable_on :tags
  mount_uploader :video, ClipUploader

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
    `ffmpeg -i public#{video} -filter_complex "fps=10,scale=-1:320,crop=ih:ih,setsar=1,palettegen" #{palette_path}`
    `ffmpeg -i public#{video} -i #{palette_path} -filter_complex "[0]fps=10,scale=-1:340,crop=ih:ih,setsar=1[x];[x][1:v]paletteuse" #{gif_path}`
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

  def upload(file_name, path)
      # 要上传的空间
      bucket = 'gifme'
      # 上传到七牛后保存的文件名
      key = file_name
      # binding.pry
      # 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
      put_policy = Qiniu::Auth::PutPolicy.new(
          bucket, # 存储空间
          key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
          3600    # token 过期时间，默认为 3600 秒，即 1 小时
      )
      # 生成上传 Token
      uptoken = Qiniu::Auth.generate_uptoken(put_policy)
      # 要上传文件的本地路径
      filePath = "public/#{path}/#{file_name}"
      # 调用 upload_with_token_2 方法上传
      code, result, response_headers = Qiniu::Storage.upload_with_token_2(
           uptoken,
           filePath,
           key,
           nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/vars.html#xvar
           bucket: bucket
      )
      #打印上传返回的信息
      puts code
      puts result
  end

end
