# What to do next:
# Figure out how to implement a shopping cart to add books/orders to
# Recommend a book to the customer
# Allow the customer to change at least the shipping address of one of their orders
# Allow the customer to delete an order (from their cart)

def main_menu
    20.times do
        Book.create(title: Faker::Book.title, author: Faker::Book.author, publisher: Faker::Book.publisher, genre: Faker::Book.genre)
    end
    cart = [] ##### CREATES A CART ARRAY #####
    try_again = true
    while try_again # prints out list of books and asks user to make order while try_again is still true
      puts "|| Here are the books we currently have in stock:"
      puts "||"
      Book.all.each do |b|
        b.print_book_info
        puts "|| -------------------------"
        puts "|| -------------------------"
      end
      puts "|| What book would you like to order?"
      print "|| "
      input = gets.chomp
      title = input.downcase
      book_titles = Book.all.map { |b| b.title.downcase }
        if book_titles.include?(title)
          book = Book.all.find { |b| b.title.downcase == title }
          c1 = Customer.all[0]
          ship_date = Faker::Date.forward(3)
          arrive_date = Faker::Date.between(Faker::Date.forward(3), Faker::Date.forward(18))
          o1 = Order.create(customer_id: c1.id, book_id: book.id, shipping_address: c1.home_address, is_shipped?: false, date_of_order: Faker::Date.between(Date.today, Date.today), estimated_shipping_date: ship_date, estimated_arrival_date: arrive_date)
          # o1 << cart # pushes the order into the cart
          puts "|| -------------------------"
          puts "|| -------------------------"
          puts "||"
          o1.print_receipt
          puts "|| Thank you for your order! Your book should arrive very soon!"
          puts "||"
          # c1.recommend_book_by_genre
          # puts "||"
          puts "|| Would you like to make another purchase? (y/n)"
          print "|| "
          answer = gets.chomp
          try_again = yes_or_no(answer)
        else
          puts "|| -------------------------"
          puts "|| We do not have that book in our inventory!"
          puts "||"
          puts "|| -------------------------"
          puts "||"
        end
    end

end

def yes_or_no(answer)
    x = true
    while x
        case answer.downcase
        when "n" 
          return false
        when "y" 
          return true
        else 
          puts "|| Please type \"y\" or \"n\""
          print "|| "
          answer = gets.chomp
          puts "||"
        end
    end
end