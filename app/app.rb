ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class MakersBnb < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

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
    @user = User.create(username: params[:username],
                          email: params[:email],
                          password: params[:password])

  if @user.save
    session[:user_id] = @user.id
    redirect '/home/homepage'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'/signup'
  end

    @username = session[:username]
    erb :'bnb_list'
  end

  run! if app_file == $0
end
