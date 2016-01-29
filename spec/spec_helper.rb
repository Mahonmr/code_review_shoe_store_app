ENV['RACK_ENV'] = 'test'
require('rspec')
require('mysql2')
require('sinatra/activerecord')
require('shoes')
require('shoe_stores')

RSpec.configure do |config|
  config.after(:each) do
    Shoe.all().each() do |shoe|
      shoe.destroy()
    end
    ShoeStore.all().each() do |shoe_store|
      shoe_store.destroy()
    end
  end
end

def create_survey
  Survey.create({:title => "Health Insurance!"})
end

def create_question
  Question.create({:question => "Why does health insurance suck in America?"})
end
