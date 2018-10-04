class UsersController < ApplicationController
  
  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
     redirect '/goals'
    end
  end

  post "/signup" do
    @user = User.create(username: params[:username], password: params[:password])
    if @user.valid?
      session[:user_id] = @user.id
      redirect to '/goals'
    else
      redirect to "/?error=Invalid entry"
    end
  end

  get "/login" do
    if !logged_in?
      erb :'/users/login'
    else
     redirect to '/goals'
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/goals"
    else
      redirect "/?error=Invalid entry"
    end
  end
  
  get '/users/:id' do
    if !logged_in?
      redirect '/login?error=Please login'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/goals'
    end
  end

  get "/logout" do
    if session[:user_id] != nil
      session.destroy
      redirect "/"
    else
      redirect "/?error=Invalid entry"
    end
  end
end