# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Agent.create!(name: "WOA Tech Cyber", phone: "0712345678", station: "Nairobi-West", zone: "Nairobi")
Agent.create!(name: "Port favour", phone: "0723456789", station: "Mombasa-Port", zone: "Mombasa")
