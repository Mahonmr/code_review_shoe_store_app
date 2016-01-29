require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
#require('./lib/helper')
#require('./lib/recipes')
#require('./lib/instructions')
#require('./lib/ingredients')
#require('./lib/tags')
require('mysql2')
require('pry')
also_reload('./lib/**/*.rb')

get('/') do
  erb(:index)
end

#====================shoes====================================================
