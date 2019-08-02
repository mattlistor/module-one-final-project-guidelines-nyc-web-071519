def action_on_order
    print_all_orders
    x = true
    while x
        case print_action_menu_2
        when "1" 
            if Order.all.empty?
                puts "||"
                puts "|| You do not have any orders!"
                print_break_line 
            else
                print_break_line
                delete_order_menu
            end
            action
        when "2" 
            print_break_line
            change_order_menu
            action
        else 
            puts "||"
            puts "|| Please type 1 or 2!"
            print_break_line
        end
    end

end

def print_all_orders
    Customer.first.get_orders.each{|o| o.print_receipt}
    puts "|| You have #{Customer.all[0].get_orders.count} order(s)!"
    print_break_line
end

def print_action_menu_2
    puts "|| WHAT ACTION WOULD YOU LIKE TO TAKE?"
    puts "||"
    puts "|| 1. Delete order"
    puts "|| 2. Change shipping address of order"
    puts "||"
    print "|| Enter a number: "
    answer = gets.chomp.gsub(/\W/, '')
    return answer
end

def delete_order_menu
    puts "|| WHICH ORDER WOULD YOU LIKE TO DELETE?"
    puts "||"
    x = 1
    num_book_hash = {}
    Customer.all[0].get_books.each do |book|
        puts "|| #{x}. #{book.title}"
        num_book_hash[x] = book
        x+=1
    end
    puts "||"
    print "|| Enter a number: "
    num = gets.chomp.gsub(/\W/, '').to_i
    puts "||"
    
    if num_book_hash.keys.include?(num)
        delete_order(num_book_hash[num])
    else 
        puts "|| Please enter one of the numbers!"
        print_break_line
    end
end

def delete_order(book)
    Order.all.find{|o| o.book_id == book.id}.destroy

    Customer.all[0].get_orders.each{|o| o.print_receipt}
    puts "|| You now have #{Customer.all[0].get_orders.count} order(s)!"
    print_break_line
end

###############

def change_order_menu
    puts "|| WHICH ORDER WOULD YOU LIKE TO CHANGE?"
    puts "||"
    book_to_change = list_out_orders

    if book_to_change
        change_order(book_to_change)
    else 
        puts "||"
    end
end

def change_order(book)
    puts "|| Enter the new shipping address for your order:"
    print "|| "
    new_address = gets.chomp
    puts "||"
    order_being_changed = Order.find_by(book_id: book.id)
    order_being_changed.update(shipping_address: new_address)
    order_being_changed.print_receipt
end

def list_out_orders
    x = 1
    num_book_hash = {}
    Customer.all[0].get_books.each do |book|
        puts "|| #{x}. #{book.title}"
        num_book_hash[x] = book
        x+=1
    end
    puts "||"
    print "|| Enter a number: "
    num = gets.chomp.gsub(/\W/, '').to_i

    if num_book_hash.keys.include?(num)
        print_break_line
        return num_book_hash[num]
    else 
        puts "||"
        puts "|| Please enter one of the numbers!"
        print_break_line
        change_order_menu
        return nil
    end
end