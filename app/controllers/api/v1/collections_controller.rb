class Api::V1::CollectionsController < Api::V1::BaseController
  def index
    @user = User.find(params[:user_id])
    @collections = Collection.where(user_id: @user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @gif = Gif.find(params[:gif_id])
    @collection = Collection.new(collection_params)
    @collection.gif = @gif
    @collection.user = @user
    if @collection.save
      render :index, status: :created
    else
      render_error
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    head :no_content
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :gif_id)
  end

  def render_error
    render json: { errors: @collection.errors.full_messages },
      status: :unprocessable_entity
  end
end
