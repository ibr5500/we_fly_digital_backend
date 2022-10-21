# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(fullname:'Jhon Doe', username:'Jhon2022', email:'jhon@gmail.com', password:'123456')

first_airline = Airline.create(user: user, name:'Qatar Airways', image:'https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/450px-Qatar_Airways_Logo.svg.png', price: 2189.72)
second_airline =Airline.create(user: user, name: 'Ethiopian Airlines', image:'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Ethiopian_Airlines_Logo.svg/300px-Ethiopian_Airlines_Logo.svg.png', price: 3182.12)
third_airline =Airline.create(user: user, name: 'South African Airways', image:'https://upload.wikimedia.org/wikipedia/en/thumb/7/7c/SAA_logo_%282019%29.svg/300px-SAA_logo_%282019%29.svg.png', price:1789.23)
forth_airline =Airline.create(user: user, name: 'Caribbean Airlines', image:'https://upload.wikimedia.org/wikipedia/en/thumb/1/1f/Caribbean_Airlines_logo-600x270.png/375px-Caribbean_Airlines_logo-600x270.png', price: 2803.82)

Reservation.create(airline: first_airline, user: user, city: 'Jeddah', date: '20-02-2020')
