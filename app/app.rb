ENV['RACK_ENV'] ||= 'development'
require 'sinatra/flash'
require 'sinatra/base'
require './app/models/database_setup'

class MakersBnb < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
  @user = User.new
  erb :signup
  end

  post '/signup' do
    @user = User.create(username: params[:username],
                          email: params[:email],
                          password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect '/bnblist'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/signup'
    end

  end

  get '/bnblist' do
    erb :'bnb_list'
  end

  run! if app_file == $0
end
