require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/shoe_stores')
require('./lib/shoe_brands')
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
  erb(:"/shoes/shoe_brands")
end

get('/shoe_brands/new') do
  erb(:"/shoes/shoe_brands_form")
end

post('/shoe_brands') do
  ShoeBrand.create(params)
  redirect('/shoe_brands')
end


#==================shoes stores shoe brands=====================================

post('/shoe_stores/:shoe_store_id/shoe_brands') do
  ShoeStore.join_shoe_brand(params[:shoe_store_id].to_i, params[:shoe_brand_id].to_i)
  redirect('/shoe_stores')
end

# post('/shoe_stores/:shoe_store_id/shoe_brands/:shoe_brand_id') do
#   ShoeStore.delete_shoe_brand(params[:shoe_store_id].to_i params[:shoe_brand_id].to_i)
#   redirect("/shoe_stores/#{params[:shoe_store_id].to_i}")
# end
