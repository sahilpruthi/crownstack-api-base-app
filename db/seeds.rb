# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "sahil@crownstack.com", password: "password")
user.authentication_token = JWT.encode({user_id: user.id}, 's3cr3t')
user.save

(1..10).each do |i|
	Product.create!(name: "Nikon D85#{i}", total_quantity: 10, price: 10000, description: 'Sample Product', make: 2020)
end
