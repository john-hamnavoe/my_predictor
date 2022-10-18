# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless TeamCategory.find_by(name: "International")
  TeamCategory.create(name: "International")
end

unless TeamCategory.find_by(name: "Club")
  TeamCategory.create(name: "Club")
end

unless ScoringSystem.find_by(name: "Standard")
  ScoringSystem.create(name: "Standard", range: 0)
end

unless ScoringSystem.find_by(name: "Within 7")
  ScoringSystem.create(name: "Within 7", range: 0)
end