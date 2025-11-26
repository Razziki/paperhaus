# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


OrderItem.destroy_all
Order.destroy_all
User.destroy_all
Product.destroy_all
Category.destroy_all


fiction = Category.create!(name: "Fiction")
nonfiction = Category.create!(name: "Nonfiction")
study = Category.create!(name: "Study")
indigenous = Category.create!(name: "Indigenous")

products = [
  { name: "Prairie Winds", author: "A. Sinclair", description: "Local prairie novel.", price_cents: 1999, currency: "CAD", category: fiction },
  { name: "Rails for Students", author: "K. Reid", description: "Beginner Rails guide.", price_cents: 3499, currency: "CAD", category: study },
  { name: "Manitoba Histories", author: "D. Harper", description: "Regional history.", price_cents: 2499, currency: "CAD", category: nonfiction },
  { name: "Voices of the North", author: "T. Bear", description: "Indigenous essays.", price_cents: 2999, currency: "CAD", category: indigenous },
  { name: "Intro to Algorithms", author: "C. Lee", description: "Simplified algorithms.", price_cents: 3999, currency: "CAD", category: study },
  { name: "City Lights", author: "M. Cole", description: "Short stories.", price_cents: 1799, currency: "CAD", category: fiction },
  { name: "Cooking Manitoba", author: "S. Fields", description: "Local recipes.", price_cents: 2199, currency: "CAD", category: nonfiction },
  { name: "Study Smart", author: "L. Brown", description: "Exam prep techniques.", price_cents: 1599, currency: "CAD", category: study },
  { name: "Indigenous Stories", author: "N. White", description: "Collected narratives.", price_cents: 2699, currency: "CAD", category: indigenous },
  { name: "Novel Nights", author: "P. Summers", description: "Contemporary fiction.", price_cents: 1899, currency: "CAD", category: fiction },
  { name: "Winter Roads", author: "J. McKay", description: "A quiet novel set on icy northern highways.", price_cents: 1899, currency: "CAD", category: fiction },
  { name: "Code & Coffee", author: "R. Nguyen", description: "Stories from small software shops.", price_cents: 2099, currency: "CAD", category: fiction },
  { name: "Learning Ruby on Rails", author: "S. Turner", description: "Step-by-step Rails for beginners.", price_cents: 3599, currency: "CAD", category: study },
  { name: "Study Skills Toolkit", author: "M. Allen", description: "Tools for college success.", price_cents: 1699, currency: "CAD", category: study },
  { name: "Northern Recipes", author: "C. Fontaine", description: "Comfort food for prairie winters.", price_cents: 2299, currency: "CAD", category: nonfiction },
  { name: "Prairie Wildlife Guide", author: "B. Reynolds", description: "Guide to animals of the prairies.", price_cents: 2499, currency: "CAD", category: nonfiction },
  { name: "Walking the Land", author: "E. Redsky", description: "Reflections on land and belonging.", price_cents: 2799, currency: "CAD", category: indigenous },
  { name: "Stories by the Fire", author: "K. Eagle", description: "Traditional stories retold.", price_cents: 2599, currency: "CAD", category: indigenous },
  { name: "Downtown Nights", author: "L. Carter", description: "Tales from a small city bookstore.", price_cents: 1799, currency: "CAD", category: fiction },
  { name: "Silent Campuses", author: "H. Park", description: "Mystery on a winter campus.", price_cents: 1999, currency: "CAD", category: fiction },
  { name: "Intro to Databases", author: "R. Silva", description: "Friendly intro to SQL.", price_cents: 3899, currency: "CAD", category: study },
  { name: "Exam Day Survival", author: "T. Jordan", description: "Tips for handling test anxiety.", price_cents: 1499, currency: "CAD", category: study },
  { name: "Manitoba Landscapes", author: "P. Greene", description: "Photo essays of local scenery.", price_cents: 2699, currency: "CAD", category: nonfiction },
  { name: "Everyday Finance", author: "D. Scott", description: "Basic personal finance.", price_cents: 1999, currency: "CAD", category: nonfiction },
  { name: "Teachings by the River", author: "S. Whitecloud", description: "Teachings passed down.", price_cents: 2899, currency: "CAD", category: indigenous },
  { name: "Pathways Home", author: "A. Star", description: "Stories of community and culture.", price_cents: 2799, currency: "CAD", category: indigenous },
  { name: "Campus Book Club", author: "N. Brooks", description: "Friends bond over reading.", price_cents: 1899, currency: "CAD", category: fiction },
  { name: "Snowfall Stories", author: "I. Clarke", description: "Stories set during snowstorms.", price_cents: 1699, currency: "CAD", category: fiction },
  { name: "Study Group Hacks", author: "G. Patel", description: "How to run effective study groups.", price_cents: 1599, currency: "CAD", category: study },
  { name: "Research Ready", author: "Y. Chen", description: "Guide to academic research.", price_cents: 2199, currency: "CAD", category: study }
]

products.each { |p| Product.create!(p) }

User.create!(first_name: "Admin", last_name: "User", email: "admin@paperhaus.com", password: "password", password_confirmation: "password", role: "admin")
User.create!(first_name: "Buyer", last_name: "Customer", email: "buyer@paperhaus.com", password: "password", password_confirmation: "password", role: "customer")
