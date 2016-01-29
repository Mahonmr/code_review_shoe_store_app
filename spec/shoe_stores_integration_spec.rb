ENV['RACK_ENV'] = 'test'
require ('spec_helper')
require('capybara/rspec')
require('./app')
require "pry"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('shoe box navigation', {:type => :feature}) do
  it('takes you to index page') do
    visit('/')
    expect(page).to have_content('The Shoe Box App')
  end

  it('takes you to view shoe stores') do
    visit('/')
    click_link('View Shoe Stores', visible: false)
    expect(page).to have_content('Shoe Store')
  end

  it('takes you to add a shoe store') do
    visit('/')
    click_link('Add a Shoe Store', visible: false)
    expect(page).to have_content('Add a Shoe Store')
  end

  it('takes you to view a shoe store') do
    test_store = create_shoe_store
    visit('/shoe_stores')
    click_button('View', visible: false)
    expect(page).to have_content('Inventory')
  end

  it('takes you to edit a shoe store') do
    test_store = create_shoe_store
    visit('/shoe_stores')
    click_button('Edit', visible: false)
    expect(page).to have_content('Edit the Shoe Store:')
  end

  it('takes you to view shoe') do
    visit('/')
    click_link('View Shoes', visible: false)
    expect(page).to have_content('Shoe brands')
  end

  it('takes you to add a shoe brand') do
    visit('/')
    click_link('Add a Shoe Brand', visible: false)
    expect(page).to have_content('Add a Shoe Brand')
  end


  describe('CRUD for class shoestore', {:type => :feature}) do
    it('lets you add a shoe store to app') do
      visit('/')
      click_link('Add a Shoe Store', visible: false)
      fill_in('name', with: 'Payless')
      click_button('Submit')
      expect(page).to have_content('Payless')
    end

    it('lets you edit a shoe store') do
      test_store = create_shoe_store
      visit('/shoe_stores')
      expect(page).to have_content('Nordstom')
      click_button('Edit', visible: false)
      fill_in('name', with: 'Nordstom Store')
      click_button('Submit')
      expect(page).to have_content('Nordstom Store')
    end

    it('lets you delete a shoe store') do
      test_store = create_shoe_store
      visit('/shoe_stores')
      expect(page).to have_content('Nordstom')
      click_button('Delete', visible: false)
      expect(page).to_not have_content('Nordstom')
    end

    it('will not create a record if name is left blank') do
      visit('/')
      click_link('Add a Shoe Store', visible: false)
      fill_in('name', with: ' ')
      click_button('Submit')
      expect(ShoeStore.all.length).to eq(0)
    end
  end

  describe('CRUD for class shoe brand', {:type => :feature}) do
    it('lets you add a shoe brand to app') do
      visit('/')
      click_link('Add a Shoe Brand', visible: false)
      fill_in('name', with: 'Zips')
      click_button('Submit')
      expect(page).to have_content('Zips')
    end

    it('will not create a record if name is left blank') do
      visit('/')
      click_link('Add a Shoe Brand', visible: false)
      fill_in('name', with: ' ')
      click_button('Submit')
      expect(ShoeBrand.all.length).to eq(0)
    end
  end
end
