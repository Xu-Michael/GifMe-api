class UploadJob < ApplicationJob
  queue_as :default
  HOST = Rails.env.production? ? "https://gifme-api.wogengapp.cn" : "http://localhost:3000"

  def perform(gifs)
    gifs.each do |gif|
      gif.upload(gif.video_upload, "#{HOST}")
      gif.upload("#{gif.id}.gif", "#{HOST}/saved_gifs/")
      gif.update(image: "http://p7hewqcmm.bkt.clouddn.com/#{gif.id}.gif", video: "http://p7hewqcmm.bkt.clouddn.com/#{gif.video_upload.filename}")
    end
  end
end
