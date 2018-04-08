class Api::V1::GifsController < Api::V1::BaseController
  def index
    @gifs = Gif.all
  end
end
