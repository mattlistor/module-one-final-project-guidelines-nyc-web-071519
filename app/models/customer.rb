class Customer < ActiveRecord::Base
    has_many :orders
    has_many :books, through: :orders

    def name
        "#{self.first_name}" + " #{self.last_name}"
    end

    def get_orders
        Order.all.select{|o| o.customer_id == self.id}
    end

    def get_books
        self.get_orders.map{|o| o.get_books_from_order}.flatten
    end

    def sort_books
        self.get_books.sort_by{|b| b.title}.uniq
    end

    def print_books
        puts "|| #{self.name}'s Orders:"
        puts "|| -------------------------"
        x = 1
        self.sort_books.map do |b|
            puts "|| #{x}. #{b.title}"
            x += 1
        end
        nil
    end 

    def print_customer_info
        puts "|| Name: #{self.name}"
        puts "|| Email: #{self.email}"
        puts "|| Address: #{self.home_address}"
    end

    def num_books
        self.sort_books.count
    end

    def num_orders
        self.get_orders.count
    end

    def recommend_book_by_genre
        customers_books = self.sort_books

        #gets a list of all the genres and titles
        # select instead of map (activerecord)
        genre_list = customers_books.map{|b| b.genre}

        #makes a list of books that the user doesnt own and a list of their genres
        books_to_choose_from = Book.all.reject{|b| customers_books.include?(b)}
        books_to_choose_from_genre_list = books_to_choose_from.map{|b| b.genre}

        #counts each genre and makes a tallied hash ({"Mystery" => 5, etc...})
        genre_count_hash = {}
        genre_list.each {|genre| genre_count_hash[genre] = 0}
        genre_list.each {|genre| genre_count_hash[genre] += 1}

        #creates a hash of the most common genre(s) with their amounts
        genre_count_hash.delete_if{|genre, amount| amount < genre_count_hash.values.max}

        #creates an array of the most common genres
        favorite_genre_list = genre_count_hash.keys

        #picks a random book to possibly recommend
        if (favorite_genre_list & books_to_choose_from_genre_list) == []
            puts "|| There are no books to recommend!"
            nil
        else  
            #chooses what genre we're going to recommend out of all the favorite genres
            chosen_genre = favorite_genre_list[rand(0..(favorite_genre_list.length-1))]
            
            #creates a list of books that the user doesn't own that also has the chosen favorite genre
            books_with_chosen_genre = books_to_choose_from.select{|b| b.genre == chosen_genre}

            #chooses a random book out of that list to recommend
            book_recommendation = books_with_chosen_genre[rand(0..(books_with_chosen_genre.length-1))]
        end
        # binding.pry
        #print out the info for that random book
        puts "|| #{self.name}, here is another #{chosen_genre.downcase} book:"
        puts "||"
        book_recommendation.print_book_info
        nil
    end
end