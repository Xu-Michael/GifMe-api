class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  # acts_as_token_authentication_handler_for User, except: [:create]

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def index
    # @users = policy_scope(User)
    @users = User.all

    render json: @users
  end

  def show
    # @users = policy_scope(User)
    @user = User.find(params[:id])
    @current_user_id = params[:current_user_id]
    @users_gifs = Gif.where(user_id: @user.id).order("#{:created_at} DESC")
  end

  def create

    # byebug

    # Send code, APPID and SECRET to weixin for openid and session_key
    @user = User.find_by(wx_id: wechat_id) || User.create(user_wechat_params)

    p @user
    render json: @user if @user.persisted?

  end

  private

  # def wechat_email
  #   @wechat_email ||= wechat_user.fetch('openid')  + "@myapp.com"
  # end

  def wechat_id
    @wechat_id ||= wechat_user.fetch('openid')
  end

  def user_wechat_params
    return @user_wechat_params if @user_wechat_params

    @user_wechat_params = user_params

    # GET both openid and session_key
    @user_wechat_params['wx_id'] = wechat_id
    # @user_wechat_params['password'] = wechat_user.fetch('session_key', Devise.friendly_token)
    # @user_wechat_params['authentication_token'] = @user_wechat_params['password']
    @user_wechat_params
  end

  def wechat_user
    @wechat_response ||= RestClient.post( URL, wechat_params )
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def wechat_params
    { appid: ENV.fetch('APPID'),
      secret: ENV.fetch('APPSECRET'),
      js_code: params[:code],
      grant_type: "authorization_code" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end


