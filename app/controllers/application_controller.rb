require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "hotdog"
  end

  get "/" do
    Api.new.pokemon_creator
    erb :welcome
  end

  post "/signup" do 
   
    @trainer = Trainer.new(username: params["username"], password: params["password"])
    if @trainer.save
    redirect '/home'
    else
      redirect '/'
  end

  post '/login' do 
    trainer = Trainer.find_by(:username => params[:username])
    if trainer && trainer.authenticate(params[:password])
    session[:user_id] = trainer.id
    redirect '/home'
  else
    redirect '/'
  end
  end
end

post '/logout' do
  session.clear
  redirect '/'


  get '/login' do
    @trainer = Trainer.find_by_id(session[:user_id])
    erb :home
  end

  get '/home' do
    
    @trainer = Trainer.find_by_id(session[:user_id])
    if logged_in?
    erb :home
    else
      redirect '/'
    end
  end

  helpers do
    def current_user
      @current_user ||= Trainer.find_by_id(session[:user_id])
    end

    def logged_in?
      current_user != nil
    end
  end

end
