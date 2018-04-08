# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed = [
        {
          "id": 1,
          "tags": "#secret, #gossip, #shh",
          "image": "https://media1.giphy.com/media/3o8dFgRzTzaLx3mWgo/giphy.gif",
          "author": "Converse",
          "collected": 524
        },
        {
          "id": 2,
          "tags": "#funny, #laugh, #flash",
          "image": "https://media2.giphy.com/media/3NtY188QaxDdC/giphy.gif",
          "author": "Zootopia",
          "collected": 125
        },
        {
          "id": 3,
          "tags": "#funny, #trump, #shake",
          "image": "https://media1.giphy.com/media/ASzK5wWjMtc6A/giphy.gif",
          "author": "Donald Trump",
          "collected": 54
        },
        {
          "id": 4,
          "tags": "#cat, #typing, #funny",
          "image": "https://media0.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif",
          "author": "Miao Cat",
          "collected": 78
        },
        {
          "id": 5,
          "tags": "#cat, #funny, #money",
          "image": "https://media1.giphy.com/media/ND6xkVPaj8tHO/giphy.gif",
          "author": "Miao Cat",
          "collected": 985
        },
        {
          "id": 6,
          "tags": "#baby, #funny, #spoon",
          "image": "https://media2.giphy.com/media/Jk4ZT6R0OEUoM/giphy.gif",
          "author": "Charlie",
          "collected": 55
        },
        {
          "id": 7,
          "tags": "#dog, #dance, #funny",
          "image": "https://media0.giphy.com/media/wW95fEq09hOI8/giphy.gif",
          "author": "Chiuhuahua",
          "collected": 21
        }
      ]

user = User.create(name: "Dany")
puts "Generated user #{user.name}"

seed.each do |gif|
  puts "Generating #{gif[:author]}'s gif..."
  new_gif = Gif.create(tags: gif[:tags], image: gif[:image], author: gif[:author], collected: gif[:collected])
  puts "Generating a collection with Gif: #{new_gif.id}..."
  Collection.create(user_id: user.id, gif_id: new_gif.id)
end
