class Api::V1::GifsController < Api::V1::BaseController
  def index
    @gifs = Gif.all
    @gifs_by_collections = @gifs.sort_by { |gif| -gif.collection_count }
    @gifs_by_new = @gifs.order("#{:created_at} DESC")
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
    # TencentCloudCos.configure do |config|
    #   config.app_id     = '1256511506'
    #   config.secret_id  = 'AKID1wgFi1FEYnsmV448h7MRL4proeMwPuMe'
    #   config.secret_key = 'OcmpMn4B7sTt8CEAXozza6SiolYcVKPP'
    #   config.host       = 'gifme-1256511506.cos.ap-shanghai.myqcloud.com'
    # end
    # client = COS::Client.new({
    #   app_id:     '1256511506',
    #   secret_id:  'AKID1wgFi1FEYnsmV448h7MRL4proeMwPuMe',
    #   secret_key: 'OcmpMn4B7sTt8CEAXozza6SiolYcVKPP',
    #   default_bucket: 'gifme-1256511506',
    #   protocol:   'https' # 使用https
    # })

    path_for_gif = "app/assets/#{Gif.last.id + 1}"
    `ffmpeg -i #{gif_params[:image]} -filter_complex "fps=10,scale=-1:320,crop=ih:ih,setsar=1,palettegen" app/assets/palette#{Gif.last.id + 1}.png`
    `ffmpeg -i #{gif_params[:image]} -i app/assets/palette#{Gif.last.id + 1}.png -filter_complex "[0]fps=10,scale=-1:340,crop=ih:ih,setsar=1[x];[x][1:v]paletteuse" #{path_for_gif}.gif`

    # # file = File.open("#{path_for_gif}.gif", 'r')
    # # response = TencentCloudCos.put(file, "https://gifme-1256511506.cos.ap-shanghai.myqcloud.com/#{Gif.last.id + 1}.gif")
    # client.api.upload('/gifs', "#{Gif.last.id + 1}.gif", "#{path_for_gif}.gif")
    @gif = Gif.new(gif_params)
    @gif.image = "http://localhost:3000/#{path_for_gif}.gif";
    @gif.tag_list = "rihanna"
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
    params.require(:gif).permit(:image, :user_id)
  end

  def render_error
    render json: { errors: @gif.errors.full_messages },
      status: :unprocessable_entity
  end
end
