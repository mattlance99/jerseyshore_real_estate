require 'pry'

class ListingsController < ApplicationController

  get "/listings/new" do
    erb :"listings/new"
  end
  
  post '/listings' do
    @listing = Listing.create(:address => params[:address], :price => params[:price], :bedrooms => params[:bedrooms], :bathrooms => params[:bathrooms],:agent_id => session[:id])
    redirect to "/listings/#{@listing.id}"
  end
  
  get '/listings' do
    @mylistings = Listing.all.find_all { |listing| listing.agent_id == session[:id] }
    erb :'listings/myindex'
  end
  
  get '/mylistings' do
    @mylistings = Listing.all.find_all { |listing| listing.agent_id == session[:id] }
    erb :'listings/myindex'
    
  end 
  
  get '/listings/:id' do
    @listing = Listing.find_by_id(params[:id])
    erb :'listings/show'
  end
  
  get '/listings/:id/edit' do  
    @listing = Listing.find_by_id(params[:id])

    erb :'listings/edit'
  end
  
  patch '/listings/:id' do
    @listing = Listing.find_by_id(params[:id])
    @listing.address = params[:address]
    @listing.price = params[:price]
    @listing.bedrooms = params[:bedrooms]
    @listing.bathrooms = params[:bathrooms]
    #@listing.agent_id = params[:agent_id]
    @listing.save
    redirect to "/listings/#{@listing.id}"
  end
  
  delete '/listings/:id/delete' do 
    @listing = Listing.find_by_id(params[:id])
    @listing.delete
    redirect to '/listings'
  end
  
end