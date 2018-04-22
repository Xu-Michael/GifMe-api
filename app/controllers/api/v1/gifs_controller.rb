class Api::V1::GifsController < Api::V1::BaseController
  def index
    if params[:tags].present?
      @gifs = Gif.tagged_with("#{params[:tags]}")
    else
      @gifs = Gif.all
      @gifs_by_collections = @gifs.sort_by { |gif| -gif.collection_count }
      @gifs_by_new = @gifs.order("#{:created_at} DESC")
    end
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
    @gif = Gif.create(gif_params)
    @gif.convert!
    @gif.update(image: @gif.gif_url)
    render json: @gif.id
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    head :no_content
  end

  private

  def gif_params
    params.permit(:video, :user_id)
  end

  def tag_params
    params.permit(:tags)
  end

  def render_error
    render json: { errors: @gif.errors.full_messages },
      status: :unprocessable_entity
  end
end
