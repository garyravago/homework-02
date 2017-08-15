# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all

book_classification = 
["General Works encyclopedias",
"Philosophy", 
"Psychology", 
"Religion",
"History Auxiliary Sciences",
"History (except American)",
"General U.S. History",
"Local U.S. History",
"Geography", 
"Anthropology", 
"Recreation",
"Social Sciences",
"Political Science",
"Law",
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
"Bibliography and Library Science"]

book_category = ["Fiction", "Nonfiction"]

25.times do |index|
	Author.create!( first_name: Faker::Name.first_name,
									last_name: Faker::Name.last_name,
									age: Faker::Number.between(23, 75)		
								)
end

50.times do |index|
  Book.create!(title: Faker::Book.title,
                genre: Faker::Book.genre,
                classification: book_classification[rand(0..book_classification.length-1)],
                category: book_category[rand(0..book_category.length-1)],
                year: Faker::Number.between(1990, 2017).to_s)
end

@books = Book.all
@books.each do |book|
	book.authorships.create(author_id: rand(1..25))
end