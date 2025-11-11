# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Category.destroy_all
Product.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all

fiction    = Category.create!(name: "Fiction")
nonfiction = Category.create!(name: "Nonfiction")
study      = Category.create!(name: "Study")
indigenous = Category.create!(name: "Indigenous")

products = [
  { name: "Prairie Winds",       author: "A. Sinclair", description: "Local prairie novel.",        price_cents: 1999, currency: "CAD", category: fiction },
  { name: "Rails for Students",  author: "K. Reid",     description: "Beginner Rails guide.",       price_cents: 3499, currency: "CAD", category: study },
  { name: "Manitoba Histories",  author: "D. Harper",   description: "Regional history.",           price_cents: 2499, currency: "CAD", category: nonfiction },
  { name: "Voices of the North", author: "T. Bear",     description: "Indigenous essays.",          price_cents: 2999, currency: "CAD", category: indigenous },
  { name: "Intro to Algorithms", author: "C. Lee",      description: "Simplified algorithms.",      price_cents: 3999, currency: "CAD", category: study },
  { name: "City Lights",         author: "M. Cole",     description: "Short stories.",              price_cents: 1799, currency: "CAD", category: fiction },
  { name: "Cooking Manitoba",    author: "S. Fields",   description: "Local recipes.",              price_cents: 2199, currency: "CAD", category: nonfiction },
  { name: "Study Smart",         author: "L. Brown",    description: "Exam prep techniques.",       price_cents: 1599, currency: "CAD", category: study },
  { name: "Indigenous Stories",  author: "N. White",    description: "Collected narratives.",       price_cents: 2699, currency: "CAD", category: indigenous },
  { name: "Novel Nights",        author: "P. Summers",  description: "Contemporary fiction.",       price_cents: 1899, currency: "CAD", category: fiction }
]
products.each { |p| Product.create!(p) }

User.create!(first_name: "Admin", last_name: "User",  email: "admin@paperhaus.com", password: "password", password_confirmation: "password", role: "admin")
User.create!(first_name: "Buyer", last_name: "Customer", email: "buyer@paperhaus.com",  password: "password", password_confirmation: "password", role: "customer")
