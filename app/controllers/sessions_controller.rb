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
	
	get "/logout" do
		session.clear
		redirect "/"
	end
	
	get "/failure" do
		erb :'agents/failure'
	end
	
	post "/login" do
		agent = Agent.find_by(:username => params[:username])
		if agent && agent.authenticate(params[:password])
			session[:agent_id] = agent.id
			redirect '/listings'
		else
			redirect "/failure"
		end
	end
  
	post "/signup" do
		agent = Agent.new(:username => params[:username], :password => params[:password])
		if agent.save
			redirect "/login"
		else
			redirect "/failure"
		end
	end
	
end