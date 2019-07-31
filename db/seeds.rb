require_relative '../bin/run.rb'

# Order.destroy_all
# Customer.destroy_all
# Book.destroy_all

def create_people(num)
    num.times do
        Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, home_address: Faker::Address.full_address)

    end 
end

def create_books(num)
    num.times do
        Book.create(title: Faker::Book.title, author: Faker::Book.author, publisher: Faker::Book.publisher, genre: Faker::Book.genre)
    end 
end 

#Each customer orders one random book
def create_orders
    Customer.all.each do |c|
        ship_date = Faker::Date.forward(3)
        arrive_date = Faker::Date.between(Faker::Date.forward(3), Faker::Date.forward(18))
        #Ask ian about the book_id statement
        Order.create(book_id: rand(1..(Book.all.length)), customer_id: c.id, shipping_address: Faker::Address.full_address, is_shipped?: false, date_of_order: Faker::Date.between(Date.today, Date.today), estimated_shipping_date: ship_date, estimated_arrival_date: arrive_date)
    end
    nil
end

####################################################################################################################################################

def print_customer_names
    puts "|| ALL CUSTOMERS"
    puts "|| --------------"
    puts Customer.all.map {|c| "|| #{c.name}"}
    nil
end

def print_books
    puts "|| ALL BOOKS"
    puts "|| --------------"
    puts Book.all.map{|b| "|| \"#{b.title}\" -- #{b.genre}"} 
    nil
end

def print_orders
    puts "|| ALL ORDERS"
    puts "|| --------------"
    puts "||"
    alphabetize.each do |c| 
        c.print_books
        puts "||"
    end
    nil
end

def count_books_by_genre(genre_string)
    get_books_by_genre(genre_string).count
end

def get_books_by_genre(genre_string)
    Book.all.select {|b| b.genre.downcase == genre_string.downcase}
end

def print_alphabetized_customer_names
    puts "|| ALL CUSTOMERS A-Z"
    puts "|| -----------------"
    puts alphabetize.map{|c| "|| #{c.name}"}
end

def alphabetize
    Customer.all.sort_by{|c| c.last_name}
end

def num_of_total_books
    Book.all.count
end

def num_of_total_customers
    Customer.all.count
end

def num_of_total_orders
    Order.all.count
end

def print_most_popular_book
    get_most_popular_book.print_book_info
end

def get_most_popular_book
    Book.all.sort_by{|b| b.num_customers}.last
end

def get_book_by_title(title)
    Book.all.find{|b| b.title.downcase == title.downcase}
end

def most_books?
        
end 

create_books(200)
#create_people(3)
# 50.times do
#     create_orders
# end


#c1 = Customer.create(first_name: "Matt", last_name: "Listor")
binding.pry
# b1 = Book.create(title: "book1", author: "author1", publisher: "pub1", genre: "Mystery")
# b2 = Book.create(title: "book2", author: "author2", publisher: "pub2", genre: "Mystery")
# b3 = Book.create(title: "book3", author: "author3", publisher: "pub3", genre: "Humor")
# b4 = Book.create(title: "book4", author: "author4", publisher: "pub4", genre: "Mystery")
# Order.create(book_id: b1.id, customer_id: c1.id)
# Order.create(book_id: b2.id, customer_id: c1.id)
# Order.create(book_id: b3.id, customer_id: c1.id)
# c1.recommend_book_by_genre















# print_people_names
# print_orders

# def print_orders
#     puts "ORDERS"
#     puts "--------"
#     hash = {}
#     Order.all.each do |o|
#         key = Customer.all.select {|c| o.customer_id == c.id}.first.name
#         value = Book.all.select {|b|o.book_id == b.id}.first.title
#         hash[key] = value
#     end
#     new_hash = hash.sort_by{|cust_name, book_title| cust_name.split(' ').last}
#     x = 1
#     new_hash.each do |cust_name, book_title| 
#         puts "#{x}. #{cust_name}\n#{find_indent(x)}#{book_title}"
#         puts " "
#         x += 1
#     end
#     nil
# end

# def find_indent(x)
#     space = "#{x}. "
#     space_array = space.split('')
#     space.length.times do |x|
#         if space_array[x] != " "
#             space_array[x] = " "
#         end
#     end
#     space_array.join
# end

