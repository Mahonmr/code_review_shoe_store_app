require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/shoe_stores')
require('./lib/shoes')
require('mysql2')
require('pry')
also_reload('./lib/**/*.rb')

get('/') do
  erb(:index)
end

#====================shoes====================================================
