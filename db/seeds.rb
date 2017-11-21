# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# reset database

Book.destroy_all
Author.destroy_all
50.times do
  Book.create(
    title: Faker::Book.title,
    sub_title: Faker::Movie.quote,
    genre: Faker::Book.genre, 
    classification: Book.classifications.sample, 
    book_type: Book.book_types.sample, 
    year: Faker::Number.between(2000, 2017)
  )
end

25.times do 
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(17, 70)
  )
end

books = Book.all
author_ids = Author.pluck(:id)

books.each do | book |
  Authorship.create!(book_id: book.id, author_id: author_ids.sample)
end
