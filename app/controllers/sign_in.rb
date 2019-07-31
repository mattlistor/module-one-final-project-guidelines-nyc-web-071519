def sign_in
    Order.destroy_all
    Customer.destroy_all
    Book.destroy_all
    puts "|| WELCOME TO OUR SHOESTORE DATABASE"
    puts "||"
    puts "|| What is your first name?"
    print "|| "
    first_name = gets.chomp
    puts "||"
    puts "|| What is your last name?"
    print "|| " 
    last_name = gets.chomp
    puts "||"
    puts "|| What is your email?"
    print "|| " 
    email = gets.chomp
    puts "||"
    puts "|| What is your address?"
    print "|| " 
    address = gets.chomp
    puts "||"
    puts "|| Signing you in..."
    puts "||"
    c1 = Customer.create(first_name: first_name, last_name: last_name, email: email, home_address: address)
    c1.print_customer_info
    print_break_line
end 

def print_break_line
    puts "||"
    puts "|| ---------------------------------"
    puts "||"
end