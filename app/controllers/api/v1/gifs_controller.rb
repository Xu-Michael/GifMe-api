class Api::V1::GifsController < Api::V1::BaseController
  def index
    if params[:tags].present?
      @gifs = Gif.tagged_with("#{params[:tags]}")
    else
      @gifs = Gif.all
      @gifs_by_collections = @gifs.sort_by { |gif| -gif.collection_count }
      @gifs_by_new = @gifs.order("#{:created_at} DESC")
    end
    @user_id = params[:user_id]
    @top_ten_tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])
    if @gif.tag_list = tag_params[:tags]
      @gif.save
      render :show
    else
      render_error
    end
  end

  def create
    @gif = Gif.new(video_upload: gif_params[:video_upload], user_id: gif_params[:user_id])
    @gif.tag_list = gif_params[:tags]
    @gif.save!
    @gif.convert!
    @gif.update(image: @gif.gif_url, video: @gif.video_url)
    # @gif.upload(@gif.video.filename, "uploads/gif/video")
    # @gif.upload("#{@gif.id}.gif", "saved_gifs")
    # @gif.update(image: "http://p7hewqcmm.bkt.clouddn.com/#{@gif.id}.gif", video: "http://p7hewqcmm.bkt.clouddn.com/#{@gif.video.filename}")
    render json: @gif.id
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    head :no_content
  end

  private

  def gif_params
    params.permit(:video_upload, :user_id, :tags)
  end

  def render_error
    render json: { errors: @gif.errors.full_messages },
      status: :unprocessable_entity
  end
end
