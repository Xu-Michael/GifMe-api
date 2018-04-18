class GifUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
