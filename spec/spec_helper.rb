ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

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
