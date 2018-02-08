ENV['RACK_ENV'] ||= 'development'
require 'sinatra/flash'
require 'sinatra/base'
require './app/models/database_setup'
# set :public_folder, Proc.new { File.join(public, "static") }


class MakersBnb < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def space_id
      @space_id ||= Space.get(session[:space_id])
    end
  end

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    erb :signup
  end

  get '/login' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/login'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye'
    redirect '/'
  end

  post '/signup' do
    @user = User.create(username: params[:username],
                          email: params[:email],
                          password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/signup'
    end
  end

  get '/spaces' do
    @username = session[:username]
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    Space.create(space_name:params[:space_name],
      space_description: params[:space_description],
      space_price: params[:space_price],
      availability_start: params[:availability_start],
      availability_end: params[:availability_end],
      user: current_user)
    redirect '/spaces'
  end

  get '/booking' do
    erb :booking
  end

  post '/spaces/booking' do
    session[:space_id] = params[:post_id]

    redirect '/booking'
  end

  get '/request' do
    erb :request
  end

  post '/request' do
    redirect '/request'
  end


  run! if app_file == $0
end
