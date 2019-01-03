require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #set :views, Proc.new { File.join(root, "../views/") }
    
    enable :sessions 
    set :session_secret, "testsecret"
  end

end