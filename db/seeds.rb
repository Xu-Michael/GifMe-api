Collection.destroy_all
Gif.destroy_all
User.destroy_all

5.times do
  user = User.create(name: Faker::Name.name, avatar: Faker::Avatar.image)
  puts "Generated user #{user.name}"
end

seed = [
        {
          "id": 1,
          "image": "https://media1.giphy.com/media/3o8dFgRzTzaLx3mWgo/giphy.gif",
          "user_id": ""
        },
        {
          "id": 2,
          "image": "https://media2.giphy.com/media/3NtY188QaxDdC/giphy.gif",
          "user_id": ""
        },
        {
          "id": 3,
          "image": "https://media1.giphy.com/media/ASzK5wWjMtc6A/giphy.gif",
          "user_id": ""
        },
        {
          "id": 4,
          "image": "https://media0.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif",
          "user_id": ""
        },
        {
          "id": 5,
          "image": "https://media1.giphy.com/media/ND6xkVPaj8tHO/giphy.gif",
          "user_id": ""
        },
        {
          "id": 6,
          "image": "https://media2.giphy.com/media/Jk4ZT6R0OEUoM/giphy.gif",
          "user_id": ""
        },
        {
          "id": 7,
          "image": "https://media0.giphy.com/media/wW95fEq09hOI8/giphy.gif",
          "user_id": ""
        }
      ]

seed.each do |gif|
  puts "Generating user #{gif[:user_id]}'s gif..."
  new_gif = Gif.create(image: gif[:image], user_id: User.all.sample.id)
  puts "Generating a collection with Gif: #{new_gif.id}..."
  Collection.create(user_id: new_gif.user_id, gif_id: new_gif.id)
end

a = Gif.first
a.tag_list = "secret, gossip, shh"
a.save
puts "1. tag list = #{a.tag_list}"

b = Gif.find(a.id + 1)
b.tag_list = "funny, laugh, flash"
b.save
puts "2. tag list = #{b.tag_list}"

c = Gif.find(b.id + 1)
c.tag_list = "funny, trump, shake"
c.save
puts "3. tag list = #{c.tag_list}"

d = Gif.find(c.id + 1)
d.tag_list = "cat, typing, funny"
d.save
puts "4. tag list = #{d.tag_list}"

e = Gif.find(d.id + 1)
e.tag_list = "cat, funny, money"
e.save
puts "5. tag list = #{e.tag_list}"

f = Gif.find(e.id + 1)
f.tag_list = "baby, funny, spoon"
f.save
puts "6. tag list = #{f.tag_list}"

g = Gif.find(f.id + 1)
g.tag_list = "dog, dance, funny"
g.save
puts "7. tag list = #{g.tag_list}"
