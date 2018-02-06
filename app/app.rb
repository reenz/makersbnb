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

    redirect '/bnblist'
  end

  get '/bnblist' do
    @username = session[:username]
    erb :'bnb_list'
  end

end
