class Book < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def get_orders
        Order.all.select{|o| o.book_id == self.id}
    end

    def get_customers
        self.get_orders.map{|o| o.get_customers_from_order}.flatten
    end

    def sort_customers
        self.get_customers.sort_by{|c| c.last_name}.uniq
    end

    def print_customers
        puts "|| Buyers of #{self.title}"
        puts "|| -------------------------"
        x = 1
        self.sort_customers.map do |c|
            puts "|| #{x}. #{c.name}"
            x += 1
        end
        nil
    end 

    def num_customers
        self.sort_customers.count
    end

    def num_orders
        self.get_orders.count
    end

    def print_book_info
        puts "|| Title: #{self.title}"
        puts "|| -------------------------"
        puts "|| Author: #{self.author}"
        puts "|| Publisher: #{self.publisher}"
        puts "|| Genre: #{self.genre}"
    end

    # def print_customers
    #     books_orders = Order.all.select do |o|
    #         o.book_id == self.id
    #     end
    #     customer_array = []
    #     books_orders.each do |o|
    #         Customer.all.each do |c|
    #             if o.customer_id == c.id
    #                 customer_array << c
    #             end
    #         end
    #     end

    #     puts "Buyers of #{self.title}"
    #     puts "-------------------------"
    #     x = 1
    #     customer_array.sort_by{|c| c.last_name}.uniq.each do |c|
    #         puts "#{x}. #{c.name}"
    #         x += 1
    #     end
    #     nil
    # end 
end