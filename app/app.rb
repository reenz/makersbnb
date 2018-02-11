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
      # p "calling current user"
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/signup'
    # erb :index
  end

  get '/signup' do
    # p "Calling signup"
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
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    Space.create(space_name: params[:space_name],
      space_description: params[:space_description],
      space_price: params[:space_price],
      availability_start: params[:availability_start],
      availability_end: params[:availability_end],
      address: params[:address],
      user_id: current_user.id)
    redirect '/spaces'
  end

  get '/spaces/booking/:post_id' do
    @current_space = Space.get(params[:post_id])
    erb :booking
  end

  get '/request' do
    @requests_made = current_user.bookings
    @requests_received = current_user.spaces.flat_map { |s| s.bookings }
    erb :request
  end

  post '/request' do
    space_id = params[:space_book_id]
    space = Space.get(space_id)
    start_date = Date.parse(params[:availability_start])
    end_date = Date.parse(params[:availability_end])
    if start_date > end_date
      flash[:notice] = "Start date can't be after end date"
      redirect '/spaces/booking/' + space.id.to_s
    elsif space.unavailable?(start_date, end_date)
      flash[:notice] = "Space not available for the given dates"
      redirect '/spaces/booking/' + space.id.to_s
    elsif space.booked?(start_date, end_date)
      p "space already booked validation failed"
      flash[:notice] = "Space already booked for the given dates"
      redirect '/spaces/booking/' + space.id.to_s
    else
      booking = Booking.create(start_date: start_date, end_date: end_date, space_id: space_id,
                              user_id: current_user.id)
      flash.now[:errors] = booking.errors.full_messages
    end
    redirect '/request'
  end

  post '/confirm/:request_id' do
    booking = Booking.get(params[:request_id])
    ans = params[:answer] == "accept" ? true : false
    booking.update(confirmed: ans)
    redirect '/request'
  end

  run! if app_file == $0
end
