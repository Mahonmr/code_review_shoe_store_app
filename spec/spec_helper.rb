ENV['RACK_ENV'] = 'test'
require('rspec')
require('mysql2')
require('sinatra/activerecord')
require('shoe_brands')
require('shoe_stores')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    ShoeBrand.all.each do |shoe|
      shoe.destroy()
    end
    ShoeStore.all.each do |shoe_store|
      shoe_store.destroy
    end
  end
end

def create_shoe
  ShoeBrand.create({:name => "Nike"})
end

def create_shoe_two
  ShoeBrand.create({:name => "Adidas"})
end

def create_shoe_store
  ShoeStore.create({:name => "Nordstom"})
end

def create_shoe_store_two
  ShoeStore.create({:name => "Portland Running Company"})
end
