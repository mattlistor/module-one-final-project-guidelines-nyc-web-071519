def shop_menu
    try_again = true
    while try_again
        print_books_in_stock
        title = ask_for_title
        puts "||"
        if get_book_titles.include?(title)
            order_book(Customer.all[0], Book.all.find{|b| b.title.downcase.gsub(/\W/, '') == title }).print_receipt
            puts "|| Thank you for your order! Your book should arrive very soon!"
            puts "||"
            try_again = yes_or_no
        else 
            puts "|| We do not have that book in our inventory!"
            print_break_line
        end
    end
end

def print_books_in_stock
    puts "|| WE CURRENTLY HAVE #{Book.all.count} BOOKS IN STOCK:"
        puts "||"
        Book.all.each do |b|
            b.print_book_info
            puts "||"
            puts "||"
        end
        puts "|| WE CURRENTLY HAVE #{Book.all.count} BOOKS IN STOCK:"
        puts "||"
end

def create_books(num)
    num.times do
        Book.create(title: Faker::Book.title, author: Faker::Book.author, publisher: Faker::Book.publisher, genre: Faker::Book.genre)
    end 
end 

def yes_or_no
    puts "|| Would you like to make another purchase? (y/n)"
    print "|| "
    answer = gets.chomp
    x = true
    while x
        case answer.downcase
        when "n" 
          print_break_line
          return false
        when "y" 
          print_break_line
          return true
        else 
          puts "|| Please type \"y\" or \"n\""
          print "|| "
          answer = gets.chomp
          puts "||"
        end
    end
end

def print_break_line
    puts "||"
    puts "|| ---------------------------------"
    puts "||"
end

def order_book(customer, book)
    ship_date = Faker::Date.forward(3)
    arrive_date = Faker::Date.between(Faker::Date.forward(3), Faker::Date.forward(18))
    Order.create(customer_id: customer.id, book_id: book.id, shipping_address: customer.home_address, is_shipped?: false, date_of_order: Faker::Date.between(Date.today, Date.today), estimated_shipping_date: ship_date, estimated_arrival_date: arrive_date)
end

def ask_for_title
    puts "|| What book would you like to order?"
    print "|| "
    gets.chomp.downcase.gsub(/\W/, '')
end

def get_book_titles
    Book.all.map{|b| b.title.downcase.gsub(/\W/, '')}
end