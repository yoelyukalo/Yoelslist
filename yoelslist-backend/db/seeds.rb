# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "reizl", password: "sample")
user2 = User.create(email: "bobby shmurda", password: "ah ah ahh")
user3 = User.create(email: "kanye", password: "wtf")
user4 = User.create(email: "franky", password: "boys do cry")

post1 = Post.create(title: 'Used 1989 Dirt Bike', cost: 13999.0, body: "used piece of shit", user_id: User.first.id)

