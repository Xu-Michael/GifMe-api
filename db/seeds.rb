Collection.destroy_all
Gif.destroy_all
User.destroy_all

user = User.create(name: Faker::Name.name, avatar: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1020377488,888137863&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3195064869,2955373922&fm=58&bpow=320&bpoh=480")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1373411777,3992091759&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1224306677,1730366661&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "http://img5.imgtn.bdimg.com/it/u=3489097932,2407462821&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "http://img4.imgtn.bdimg.com/it/u=3931910830,796153240&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"
user = User.create(name: Faker::Name.name, avatar: "http://img0.imgtn.bdimg.com/it/u=585772730,4282489784&fm=27&gp=0.jpg")
puts "Generated user #{user.name}"


seed = [
        {
          "id": 1,
          "image": "https://media.giphy.com/media/kYTPMpeT4FQcM/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-crop.mp4"
        },
        {
          "id": 2,
          "image": "https://media.giphy.com/media/3oEdv898CETgzT5vxu/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4.mp4"
        },
        {
          "id": 3,
          "image": "https://media.giphy.com/media/3oEjI7M0cOXG0j4HWU/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%281%29.mp4"
        },
        {
          "id": 4,
          "image": "https://media.giphy.com/media/kMdlyJ74u9khW/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%282%29.mp4"
        },
        {
          "id": 5,
          "image": "https://media.giphy.com/media/51Uiuy5QBZNkoF3b2Z/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%283%29.mp4"
        },
        {
          "id": 6,
          "image": "https://media.giphy.com/media/CCcSD7rlc0DoQ/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%284%29.mp4"
        },
        {
          "id": 7,
          "image": "https://media.giphy.com/media/3o7abCJnPhzwYzbvDW/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%285%29.mp4"
        },
        {
          "id": 8,
          "image": "https://media.giphy.com/media/zCln43mMti1UI/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%286%29.mp4"
        },
        {
          "id": 9,
          "image": "https://media.giphy.com/media/ZUOlQXqO0qbAI/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%287%29.mp4"
        },
        {
          "id": 10,
          "image": "https://media.giphy.com/media/nsxtyVrqgYef6/giphy.gif",
          "video": "http://p7hewqcmm.bkt.clouddn.com/ezgif.com-gif-to-mp4%20%288%29.mp4"
        }
      ]

seed.each do |gif|
  puts "Generating user #{gif[:user_id]}'s gif..."
  new_gif = Gif.create(image: gif[:image], video: gif[:video], user_id: User.all.sample.id)
  puts "Generating a collection with Gif: #{new_gif.id}..."
  Collection.create(user_id: new_gif.user_id, gif_id: new_gif.id)
end

a = Gif.first
a.tag_list = "lighter, funny, smoke"
a.save
puts "1. tag list = #{a.tag_list}"

b = Gif.find(a.id + 1)
b.tag_list = "stare, pug, dog"
b.save
puts "2. tag list = #{b.tag_list}"

c = Gif.find(b.id + 1)
c.tag_list = "old lady, dab"
c.save
puts "3. tag list = #{c.tag_list}"

d = Gif.find(c.id + 1)
d.tag_list = "dolphin, laugh, bubble"
d.save
puts "4. tag list = #{d.tag_list}"

e = Gif.find(d.id + 1)
e.tag_list = "dog, scared, stare"
e.save
puts "5. tag list = #{e.tag_list}"

f = Gif.find(e.id + 1)
f.tag_list = "cat, cute, looking"
f.save
puts "6. tag list = #{f.tag_list}"

g = Gif.find(f.id + 1)
g.tag_list = "captain, facepalm, sigh"
g.save
puts "7. tag list = #{g.tag_list}"

h = Gif.find(g.id + 1)
h.tag_list = "excited, office, celebrate"
h.save
puts "7. tag list = #{h.tag_list}"

i = Gif.find(h.id + 1)
i.tag_list = "excited, girl, celebrate"
i.save
puts "7. tag list = #{i.tag_list}"

j = Gif.find(i.id + 1)
j.tag_list = "boy, sad, grumpy"
j.save
puts "7. tag list = #{j.tag_list}"
