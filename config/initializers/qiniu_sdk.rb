require 'qiniu'
Qiniu.establish_connection! access_key: ENV["qiniu_access"],
                            secret_key: ENV["qiniu_secret"]
