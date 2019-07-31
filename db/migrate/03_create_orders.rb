class CreateOrders < ActiveRecord::Migration[4.2]
    def change
        create_table :orders do |t|
            t.integer :customer_id
            t.integer :book_id
            t.string :shipping_address
            t.boolean :is_shipped? 
            t.datetime :date_of_order
            t.datetime :estimated_shipping_date
            t.datetime :estimated_arrival_date
         end
    end
end