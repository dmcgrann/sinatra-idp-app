class UsersController < ApplicationController
  
  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
     redirect '/goals'
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.new(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id

      redirect to '/goals'
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
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/goals"
    else
      redirect to "/signup"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end
end