require 'pry'

class SessionsController < ApplicationController
  
  get '/' do 
    erb :'/agents/welcome'
  end
  
  get '/signup' do
    erb :'/agents/signup'
  end 
  
  get "/login" do
		erb :'/agents/login'
	end
  

end