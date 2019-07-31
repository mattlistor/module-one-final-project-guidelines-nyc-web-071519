class CreateCustomers < ActiveRecord::Migration[4.2]
    def change
        create_table :customers do |t|
            t.string :first_name
            t.string :last_name
            t.string :email
            t.string :home_address
         end
    end
end