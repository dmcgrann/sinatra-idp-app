require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'idpforme'
  end

  get "/" do
    erb :index
  end
  
  helpers do
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=Please login to continue."
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
