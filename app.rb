require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end

  def logged_in?
    session[:user_id].present?
  end

  def user_joined?(meetup)
    meetup.users.map(&:id).include?(session[:user_id])
  end

end

get '/' do
  redirect '/meetups'
end
get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)

  if logged_in?
    @my_meetups = User.find(session[:user_id]).meetups
  end

  erb :'meetups/index'
end

get '/meetups/new' do
  if session[:user_id].nil?
    flash[:notice] = "You are not signed in"
    redirect '/meetups'
  end
  @meetup = Meetup.new
  erb :'meetups/new'
end

get '/meetups/:id' do
  if session[:user_id].nil?
      flash[:notice] = "You are not signed in"
      redirect '/meetups'
  end
  @meetup = Meetup.find(params['id'])
  @button_text = user_joined?(@meetup) ? "Leave Meetup" : "Join!"

  memberships = @meetup.meetup_memberships
  memberships.each do |membership|
    if membership.creator_id == true
      @creator = membership.user
    end
  end
  erb :'meetups/show'
end

post '/meetups' do
  @meetup = Meetup.new(params[:new_meetup])

  MeetupMembership.create(user: current_user, meetup: @meetup, creator_id: true)
  if @meetup.save
    flash[:notice] = "You have created a new Meetup!"

    redirect "/meetups/#{@meetup.id}"
  else
    flash.now[:notice] = @meetup.errors.full_messages

    erb :'meetups/new'
  end
end

post '/meetups_join' do
  content_type :json
  @meetup = Meetup.find(params[:meetup_id])
  @user   = User.find(session[:user_id])
  MeetupMembership.create(user: current_user, meetup: @meetup, creator_id: false)
  @user.to_json
end

post '/meetups_leave' do
  content_type :json
  @meetup = Meetup.find(params[:meetup_id])
  @user   = User.find(session[:user_id])
  @meetup.users.delete @user
  { id: @user.id }.to_json
end
