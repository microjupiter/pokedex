require './config/environment'

class TrainerController < ApplicationController

  # creates a new trainer and assigns them a session w/ their user id. redirects user to their unique homepage to capture/release pokemon
post "/signup" do 
  @trainer = Trainer.create(username: params["username"], password: params["password"])
  session[:user_id] = @trainer.id
  redirect '/pokemons'
end

# checks if trainer logging in is already in the db and using the correct password. redirects to their unique homepage to capture/release, or back to welcome to try again
post '/login' do 
  trainer = Trainer.find_by(:username => params[:username])
  if trainer && trainer.authenticate(params[:password])
  session[:user_id] = trainer.id
  redirect '/pokemons'
else
  redirect '/'
  end
end

# logs the trainer out and clears their session. redirects back to welcome to sign up or login again
post '/logout' do
  session.clear
  redirect '/'
end


get '/login' do
    @trainer = Trainer.find_by_id(session[:user_id])
    erb :'trainers/pokemons'
end

# looks for trainer based on their session and uses a helper to check if their logged in. loads 
get '/pokemons' do
  @trainer = Trainer.find_by_id(session[:user_id])
  if logged_in?
  erb :'trainers/pokemons'
  else
    redirect '/'
  end
end

# shows the trainer their unique page with their captured pokemon
get '/show' do
  erb :'pokemons/show'
end

# shows the trainer their unique page with their captured pokemon
post '/show' do
  redirect '/show'
end


post '/pokemons' do
  redirect '/pokemons'
end

post '/trainer' do
  @trainer = Trainer.find_by_id(session[:user_id])
  if logged_in?
  erb :'trainers/edit'
  else
  redirect '/'
  end
end

get '/trainer' do
  erb :'/trainers/edit'
end

patch '/trainer/edit' do
  @trainer = Trainer.find_by_id(session[:user_id])
  @trainer.hometown = params["hometown"]
  @trainer.age = params["age"]
  @trainer.save
  if logged_in?
    erb :'trainers/edit'
    else
    redirect '/'
    end
end

get '/trainers/edit' do
  erb :'/trainers/edit'
end

# deletes trainer based on their id. redirects to welcome screen
delete '/delete/:user_id' do
  Trainer.destroy(params[:user_id])
  redirect '/'
  end
end