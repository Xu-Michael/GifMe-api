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
  new_gif = Gif.create(image: gif[:image], user_id: rand(1..5))
  puts "Generating a collection with Gif: #{new_gif.id}..."
  Collection.create(user_id: new_gif.user_id, gif_id: new_gif.id)
end

Gif.find(1).tag_list = "secret, gossip, shh"
Gif.find(2).tag_list = "funny, laugh, flash"
Gif.find(3).tag_list = "funny, trump, shake"
Gif.find(4).tag_list = "cat, typing, funny"
Gif.find(5).tag_list = "cat, funny, money"
Gif.find(6).tag_list = "baby, funny, spoon"
Gif.find(7).tag_list = "dog, dance, funny"
