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

#====================shoes stores===============================================

get('/shoe_stores') do
  @shoe_stores = ShoeStore.all
  erb(:"/shoe_store/shoe_stores")
end

get('/shoe_stores/new') do
  erb(:"/shoe_store/shoe_stores_form")
end

post('/shoe_stores') do
  ShoeStore.create(params)
  redirect('/shoe_stores')
end

get('/shoe_stores/:id') do
  @shoe_store = ShoeStore.find(params[:id].to_i)
  erb(:"/shoe_store/shoe_stores_view")
end

get('/shoe_stores/:id/edit') do
  @shoe_store = ShoeStore.find(params[:id].to_i)
  erb(:"/shoe_store/shoe_stores_edit")
end

patch('/shoe_stores/:id') do
  @shoe_store = ShoeStore.find(params[:id].to_i)
  @shoe_store.update(name: params[:name])
  redirect('/shoe_stores')
end

delete('/shoe_stores/:id') do
  @shoe_store = ShoeStore.find(params[:id].to_i)
  @shoe_store.delete
  redirect('/shoe_stores')
end

#====================shoes======================================================

get('/shoe_brands') do
  @shoes = ShoeBrand.all
  erb(:"/shoes/shoes")
end

get('/shoe_brands/new') do
  erb(:"/shoes/shoes_form")
end

post('/shoe_brands') do
  ShoeBrand.create(params)
  redirect('/shoe_brands')
end
