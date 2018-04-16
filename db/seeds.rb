5.times do
  user = User.create(name: Faker::Name.name, avatar: Faker::Avatar.image)
  puts "Generated user #{user.name}"
end

seed = [
        {
          "id": 1,
          "tags": "#secret, #gossip, #shh",
          "image": "https://media1.giphy.com/media/3o8dFgRzTzaLx3mWgo/giphy.gif",
          "user_id": "",
          "collected": 524
        },
        {
          "id": 2,
          "tags": "#funny, #laugh, #flash",
          "image": "https://media2.giphy.com/media/3NtY188QaxDdC/giphy.gif",
          "user_id": "",
          "collected": 125
        },
        {
          "id": 3,
          "tags": "#funny, #trump, #shake",
          "image": "https://media1.giphy.com/media/ASzK5wWjMtc6A/giphy.gif",
          "user_id": "",
          "collected": 54
        },
        {
          "id": 4,
          "tags": "#cat, #typing, #funny",
          "image": "https://media0.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif",
          "user_id": "",
          "collected": 78
        },
        {
          "id": 5,
          "tags": "#cat, #funny, #money",
          "image": "https://media1.giphy.com/media/ND6xkVPaj8tHO/giphy.gif",
          "user_id": "",
          "collected": 985
        },
        {
          "id": 6,
          "tags": "#baby, #funny, #spoon",
          "image": "https://media2.giphy.com/media/Jk4ZT6R0OEUoM/giphy.gif",
          "user_id": "",
          "collected": 55
        },
        {
          "id": 7,
          "tags": "#dog, #dance, #funny",
          "image": "https://media0.giphy.com/media/wW95fEq09hOI8/giphy.gif",
          "user_id": "",
          "collected": 21
        }
      ]

seed.each do |gif|
  puts "Generating #{gif[:author]}'s gif..."
  new_gif = Gif.create(tags: gif[:tags], image: gif[:image], user_id: rand(1..5), collected: gif[:collected])
  puts "Generating a collection with Gif: #{new_gif.id}..."
  Collection.create(user_id: new_gif.user_id, gif_id: new_gif.id)
end
