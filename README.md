# yelp-clone
Yelp mini clone (Makers Week 8)
This is a study repo for Makers Academy week 8, for learning how rails works

##Getting started with Rails
* To create a new rails app running on postgres
`$ rails new yelp_clone -d postgresql -T`  
* Get your db up and running; (open postgreSQL btw) in terminal:
`$ rake db:create`  
* Setup for rspec testing:
In Gemfile:
```
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
``` 
Command line:
```
bundle
rails generate rspec:install
```
spec/rails_helper.rb:
`require 'capybara/rails'` 
 
