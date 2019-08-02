require_relative '../config/environment'
require_relative '../app/app_controller.rb'

sign_in
#create_books(100)

Book.create(title: "Book 1", author: "Author 1", publisher: "Publisher 1", genre: "Romance")
Book.create(title: "Book 2", author: "Author 2", publisher: "Publisher 2", genre: "Thriller")
Book.create(title: "Book 3", author: "Author 3", publisher: "Publisher 3", genre: "Thriller")
Book.create(title: "Book 4", author: "Author 4", publisher: "Publisher 4", genre: "Thriller")
Book.create(title: "Book 5", author: "Author 5", publisher: "Publisher 5", genre: "Romance")
Book.create(title: "Book 6", author: "Author 6", publisher: "Publisher 6", genre: "Novel")
Book.create(title: "Book 7", author: "Author 7", publisher: "Publisher 7", genre: "Nonficton")

shop_menu
action