require './config/environment'

class TrainerController < ApplicationController

post "/signup" do 
  @trainer = Trainer.create(username: params["username"], password: params["password"])
  session[:user_id] = @trainer.id
  redirect '/home'
end


post '/login' do 
  trainer = Trainer.find_by(:username => params[:username])
  if trainer && trainer.authenticate(params[:password])
  session[:user_id] = trainer.id
  redirect 'home'
else
  redirect '/'
  end
end


post '/logout' do
  session.clear
  redirect '/'
end


get '/login' do
    @trainer = Trainer.find_by_id(session[:user_id])
    erb :'trainers/home'
end

get '/home' do
    
  @trainer = Trainer.find_by_id(session[:user_id])
  if logged_in?
  erb :'trainers/home'
  else
    redirect '/'
  end
end

post '/delete/:user_id' do
  Trainer.destroy(params[:user_id])
  redirect '/'
end
end