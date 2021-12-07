# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@admin.com', password: 'admin123', password_confirmation: 'admin123') if Rails.env.development?
Product.create(name: 'Fogg Perfume', price: 1500, brand: 'Fogg')
Product.create(name: 'Nivea Perfume', price: 1500, brand: 'Nivea')
Product.create(name: 'Nike Shoes', price: 10500, brand: 'Nike')
Product.create(name: 'Skechers Shoes', price: 10500, brand: 'Skechers')
