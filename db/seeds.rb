# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# In seeds.rb
User.create(email: 'abkhamza@gmail.com', admin: true, role: :admin)
User.create(email: 'newuser@gmail.com', role: :user)
User.create(email: 'recentuser@gmail.com', role: :user)
User.create(email: 'legend@gmail.com', role: :user)
