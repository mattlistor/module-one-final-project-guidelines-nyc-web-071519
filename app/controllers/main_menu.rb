def main_menu
    puts "|| Here are the books we currently have in stock:"
    puts "||"
    20.times do
        Book.create(title: Faker::Book.title, author: Faker::Book.author, publisher: Faker::Book.publisher, genre: Faker::Book.genre)
    end
    Book.all.each do |b|
        b.print_book_info
        puts "|| -------------------------"
        puts "|| -------------------------"
    end
    puts "|| What book would you like to order?"
    print "|| "
    ##### CREATE A CART ARRAY #####
    input = gets.chomp
    title = input.downcase
    book_titles = Book.all.map { |b| b.title.downcase }
    try_again = true
    while try_again
        if book_titles.include?(title)
            book = Book.all.find { |b| b.title.downcase == title }
            c1 = Customer.all[0]
            ship_date = Faker::Date.forward(3)
            arrive_date = Faker::Date.between(Faker::Date.forward(3), Faker::Date.forward(18))
            o1 = Order.create(customer_id: c1.id, book_id: book.id, shipping_address: c1.home_address, is_shipped?: false, date_of_order: Faker::Date.between(Date.today, Date.today), estimated_shipping_date: ship_date, estimated_arrival_date: arrive_date)
            puts "|| -------------------------"
            puts "|| -------------------------"
            puts "||"
            o1.print_receipt
            puts "|| Thank you for your order! Your book should arrive very soon!"
            puts "||"
            puts "|| Would you like to make another purchase? (y/n)"
            print "|| "
            answer = gets.chomp
            try_again = yes_or_no(answer)
        else 
            puts "|| We do not have that book in our inventory!"
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