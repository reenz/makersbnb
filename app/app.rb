
require 'sinatra/base'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/spaces'
  end

  get '/spaces' do
    @username = session[:username]
    @space_name = session[:space_name]
    @space_description = session[:space_description]
    @space_price = session[:space_price]
    @space_availability = session[:space_availability]
    erb :spaces
  end

  get '/new_space' do
    erb :new_space
  end

  post '/new_space' do
    session[:space_name] = params[:space_name]
    session[:space_description] = params[:space_description]
    session[:space_price] = params[:space_price]
    session[:space_availability] = params[:space_availability]
    # redirect '/new_space'
    redirect '/spaces'
    # erb :new_space
  end

  # get '/new_space' do
  #     @space_name = session[:space_name]
  #     erb :new_space
  # end

end
