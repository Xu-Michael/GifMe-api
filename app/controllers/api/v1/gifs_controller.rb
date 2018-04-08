class Api::V1::GifsController < Api::V1::BaseController
  def index
    @gifs = Gif.all
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

  private

  def gif_params
    params.require(:gif).permit(:tags, :author, :image, :collected)
  end

  def render_error
    render json: { errors: @gif.errors.full_messages },
      status: :unprocessable_entity
  end
end
