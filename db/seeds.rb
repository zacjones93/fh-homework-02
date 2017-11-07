# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

classifications = 
["General Works - encyclopedias",
"Philosophy", "Psychology", "Religion",
"History - Auxiliary Sciences", "History (except American)",
"General U.S. History", "Local U.S. History",
"Geography", "Anthropology", "Recreation",
"Social Sciences	U", "Political Science	V",
"Law	Z - Bibliography and Library Science",
"Education",
"Music",
"Fine Arts",
"Language and Literature",
"Science",
"Medicine",
"Agriculture",
"Technology",
"Military",
"Naval Science",
"Bibliography",
"Library Science"]

book_types = ["Fiction", "Non-fiction"]

50.times do
  
  title = Faker::Book.title
  author = Faker::Book.author
  genre = Faker::Book.genre
  classification = classifications.sample
  book_type = book_types.sample
  year = Faker::Number.between(2000, 2017)
  
  b = Book.create({
      title: title, 
      author: author, 
      genre: genre, 
      classification: classification, 
      book_type: book_type, 
      year: year})
  b.save!
end

