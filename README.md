# The Shoestore Database

## Introduction

The Shoestore Database is an application written in Ruby from which users (customers) have the ability to choose among 50 books to order and ship to either their homes or a different location. These books come from a wide variety of authors, publishers, and genres, and the selection of books, provided by the Ruby gem Faker, is different with every login.

## How to Install

To install this app, simply fork and clone [this repository](https://github.com/mattlistor/module-one-final-project-guidelines-nyc-web-071519/tree/master), then in the command line type in
```ruby
bundle install
```
to install the gems you'll need (SQLLite3, ActiveRecord, Rake, Faker, among others; refer to the Gemfile for more information) to be able to run it. Afterwards, type in
```ruby
ruby bin/run.rb
```
and it should be up and running!

## Running the Application

Upon booting up this app, you (as a customer) will be prompted to sign in with your credentials. After typing in your name (your first name and then your last name), email, and home address, you will be taken to the shop menu in which you will be greeted by an inventory of 50 books along with their authors, publishers, and genres. Type in a book title from the list available that you want to order (casing, spacing, and punctuation don't matter, just the letters and their ordering). You will be repeatedly asked to type in a book until your input is valid. After typing in a valid input the app will display a receipt with your name, the title of the book you've bought, the date in which you made your purchase (i.e., today), and the dates on which your book is expected to ship and then arrive (all the dates are also generated by Faker). This means that you have successfully placed your order!

After making your first order, the app will ask you if you would like to purchase another book. Typing in "y" (again, casing, spacing, and punctuation don't matter) will take you back to the shop menu, but typing in "n" will take you to a list of options for you to take. You are then expected to perform one of four actions:

1. View your orders
2. Let the app recommend a book for you based on what genre(s) appear(s) the most frequently among the books you've ordered
3. Change or delete your orders
4. Go back to the shop menu

Type in the number corresponding to the option you want to take. Typing in "1" will display the list of purchases you've made and then take you back to the list of options, typing in "2" will print out the info of the book the app has recommended to you (and then take you back to the list of options), and typing in "4" takes you back to the shop menu where the inventory of books currently in stock is displayed. Typing in "3," meanwhile, takes you to a new menu in which you are given the options to either change the shipping address of one of your orders, cancel an order, or go back to your options. Follow what the UI of the app prompts you to enter as input in order to navigate through this menu.

To exit this app at any time, just type 'Ctrl+C' and then you're done.

And that's the Shoestore Database!