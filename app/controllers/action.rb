def action
    next_action_menu
end

def next_action_menu
    x = true
    while x
        case print_action_menu_1
        when "1" 
            print_all_orders
        when "2" 
            print_break_line
            Customer.all[0].recommend_book_by_genre
            print_break_line
        when "3" 
            action_on_order
        when "4" 
            shop_menu
        else 
            puts "|| Please type 1, 2, 3 or 4:"
            print_break_line
        end
    end
end

def print_all_orders
    Customer.all[0].get_orders.each{|o| o.print_receipt}
    puts "|| You have #{Customer.all[0].get_orders.count} order(s)!"
    print_break_line
end

def print_break_line
    puts "||"
    puts "|| ---------------------------------"
    puts "||"
end

def print_action_menu_1
    puts "|| WHAT WOULD YOU LIKE TO DO NEXT?"
    puts "||"
    puts "|| 1. View orders"
    puts "|| 2. Recommend your next book"
    puts "|| 3. Change/Delete order"
    puts "|| 4. Back to shop"
    puts "||"
    print "|| Enter a number: "
    answer = gets.chomp.gsub(/\W/, '')
    puts "|| "
    return answer
end