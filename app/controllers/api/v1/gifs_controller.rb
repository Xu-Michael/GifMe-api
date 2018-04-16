class Api::V1::GifsController < Api::V1::BaseController
  def index
    @gifs = Gif.all
    # @gifs_by_collections = @gifs.order()
    # @gifs_by_creation =
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])
    if @gif.update(gif_params)
      render :show
    else
      render_error
    end
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    head :no_content
  end

  private

  def gif_params
    params.require(:gif).permit(:tags, :author, :image, :collected)
  end

  def render_error
    render json: { errors: @gif.errors.full_messages },
      status: :unprocessable_entity
  end
end
