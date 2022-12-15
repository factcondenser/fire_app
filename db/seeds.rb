# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create seed users.
User.create_with(password: 'password').find_or_create_by(email: 'user@example.com')
User.create_with(password: 'password2').find_or_create_by(email: 'user2@example.com')

puts 'Loaded User seeds'

# Create seed categories.
ExpenseCategory::CATEGORIES.each do |category_name, subcategory_names|
  category = ExpenseCategory.find_or_create_by(name: category_name, parent: nil)
  subcategory_names.each do |subcategory_name|
    ExpenseCategory.find_or_create_by(name: subcategory_name, parent: category)
  end
end

puts 'Loaded ExpenseCategory seeds'
