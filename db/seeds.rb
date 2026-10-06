# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
randomNames = [ "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Ivy", "Jack", "Kathy", "Leo", "Mona", "Nina", "Oscar", "Paul", "Quinn", "Rachel", "Steve", "Tracy" ]
randomSurs = [ "Serpent", "Dragon", "Phoenix", "Griffin" ]
randomFruits = [ "Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape", "Honeydew", "Jackfruit", "Kiwi", "Lemon", "Mango", "Nectarine", "Orange", "Papaya", "Quince", "Raspberry", "Strawberry", "Tomato" ]
20.times do |index|
  user = User.new

  user.username = "#{randomNames.sample.downcase}_#{randomSurs.sample.downcase}_#{randomFruits.sample.downcase}_#{index + 1}"
  user.created_at = rand(30.days.to_i).seconds.ago
  user.updated_at = rand(30.days.to_i).seconds.ago
  user.password = SecureRandom.alphanumeric(32)
  user.email = "#{user.username.downcase}@goodVsEvil.com"
  user.first_name = user.username.split("_").first.capitalize
  user.last_name = user.username.split("_")[1].capitalize
  user.phone = "123-456-7890"
  user.address = "123 Main St"
  user.language = "en"
  user.save!
end
