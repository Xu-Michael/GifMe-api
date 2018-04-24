class UploadJob < ApplicationJob
  queue_as :default

  def perform(gifs)
    gifs.each do |gif|
      gif.upload(gif.video_upload.filename, "uploads/gif/video")
      gif.upload("#{gif.id}.gif", "saved_gifs")
      gif.update(image: "http://p7hewqcmm.bkt.clouddn.com/#{gif.id}.gif", video: "http://p7hewqcmm.bkt.clouddn.com/#{gif.video_upload.filename}")
    end
  end
end
