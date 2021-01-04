require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "hotdog"
  end

  get "/" do
    erb :welcome
  end

  post "/signup" do 
    
    @trainer = Trainer.create(username: params["username"], password: params["password"])
    session[:id] = @trainer.id
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

end
