class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :book

    def get_books_from_order          
        Book.all.select{|b| self.book_id == b.id}
    end

    def get_customers_from_order
        Customer.all.select{|c| self.customer_id == c.id} 
    end

    def print_receipt
        book = Book.all.find{|b| self.book_id == b.id}
        customer = Customer.all.find{|c| self.customer_id == c.id}
        puts "|| **************** YOUR PURCHASE ****************"
        puts "|| Your name:        #{customer.name}"
        puts "|| Book purchased:   #{book.title}"
        puts "|| Book genre:       #{book.genre}"
        puts "|| Shipping address: #{self.shipping_address}"
        puts "|| Purchase date:    #{self.date_of_order}"
        puts "|| Shipping date:    #{self.estimated_shipping_date}"
        puts "|| Arrival date:     #{self.estimated_arrival_date}"
        puts "|| ***********************************************"
        puts "||"
    end
end