require 'qiniu'
ENV['qiniu_access'] = "fcjw4TnA7LgS7yhpcQn7A8ptXPRfz1wDUa678vHe"
ENV['qiniu_secret'] = "PqdhTPsfY8C82qDKgzuwQvWNv5Ozw--ubgLISV8m"


Qiniu.establish_connection! access_key: ENV["qiniu_access"],
                            secret_key: ENV["qiniu_secret"]
# 要上传的空间
bucket = 'gifme'
# 上传到七牛后保存的文件名
file = 'uploads/gif/video/70/wxd60d84913b2a9b43.o6zAJs7ovmom9PKrewRghsdKs05o.pQTS7NUr2qRfaaaf129e1b12bc80482b49397357df73.mp4'
key = file
# 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
put_policy = Qiniu::Auth::PutPolicy.new(
    bucket, # 存储空间
    key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
    3600    # token 过期时间，默认为 3600 秒，即 1 小时
)
# 生成上传 Token
uptoken = Qiniu::Auth.generate_uptoken(put_policy)
# 要上传文件的本地路径
filePath = "public/#{file}"
# 调用 upload_with_token_2 方法上传
code, result, response_headers = Qiniu::Storage.upload_with_token_2(
     uptoken,
     filePath,
     key,
     nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/vars.html#xvar
     bucket: bucket
)
#打印上传返回的信息
puts code
puts result
