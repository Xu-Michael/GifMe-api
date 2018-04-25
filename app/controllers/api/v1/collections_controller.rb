class Api::V1::CollectionsController < Api::V1::BaseController
  def index
    @user = User.find(params[:user_id])
    @collections = Collection.where(user_id: @user.id)
  end

  def create
    p params

    @user = User.find(collection_params[:user_id])
    @gif = Gif.find(collection_params[:gif_id])
    @collection = Collection.new(collection_params)
    if Collection.where(gif_id: @gif.id, user_id: @user.id).exists?
      Collection.find_by(gif_id: @gif.id, user_id: @user.id).destroy
      render :show, status: :accepted
    else
      if @collection.save
        render :show,  status: :create
      else
        render_error
      end
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def destroy
    @user = User.find(collection_params[:user_id])
    @gif = Gif.find(collection_params[:gif_id])
    Collection.find_by(gif_id: @gif.id, user_id: @user.id).destroy
    render :show
  end

  private

  def collection_params
    params.require(:collection)
  end

  def render_error
    render json: { errors: @collection.errors.full_messages },
      status: :unprocessable_entity
  end
end
