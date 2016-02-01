require 'bundler/setup'
Bundler.require(:default)
require 'sinatra/base'
require 'sinatra/flash'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

enable :sessions

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
  if ShoeStore.create(params).errors.any?
    flash[:warning] = "Store not saved"
  else
    flash[:success] = "Successfully created new shoe store."
  end
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
  if @shoe_store.update(name: params[:name])
    flash[:success] = "#{@shoe_store.name} was Successfully updated."
  else
    flash[:warning] = "Store not updated"
  end
  redirect('/shoe_stores')
end

delete('/shoe_stores/:id') do
  @shoe_store = ShoeStore.find(params[:id].to_i)
  if @shoe_store.delete.errors.any?
    flash[:warning] = "Store not deleted"
  else
    flash[:success] = "Successfully deleted store #{@shoe_store.name}"
  end
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
  if ShoeBrand.create(params).errors.any?
    flash[:warning] = "Shoes not saved"
  else
    flash[:success] = "Successfully created new shoes."
  end
  redirect('/shoe_brands')
end

#==================shoes stores shoe brands=====================================

post('/shoe_stores/:shoe_store_id/shoe_brands') do
  ShoeStore.join_shoe_brand(params[:shoe_store_id].to_i, params[:shoe_brand_id].to_i)
  flash[:success] = "#{ShoeStore.store(params[:shoe_store_id].to_i)} now carries #{ShoeBrand.brand(params[:shoe_brand_id].to_i)}."
  redirect('/shoe_stores')
end

delete('/shoe_stores/:shoe_store_id/shoe_brands/:shoe_brand_id') do
  ShoeStore.delete_shoe_brand(params[:shoe_store_id].to_i, params[:shoe_brand_id].to_i)
  flash[:success] = "#{ShoeStore.store(params[:shoe_store_id].to_i)} no longer carries #{ShoeBrand.brand(params[:shoe_brand_id].to_i)}."
  redirect("/shoe_stores/#{params[:shoe_store_id].to_i}")
end
