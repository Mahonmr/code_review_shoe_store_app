ENV['RACK_ENV'] = 'test'
require ('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('shoe box navigation', {:type => :feature}) do
  it('takes you to index page') do
    visit('/')
    expect(page).to have_content('The Shoe Box App')
  end
end
