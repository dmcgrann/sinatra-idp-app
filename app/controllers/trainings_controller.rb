class TrainingsController < ApplicationController

  get '/trainings' do
    if logged_in?
      @user = current_user
      @trainings = Training.all
      erb :"/trainings/trainings"
    else
      redirect '/login'
    end
  end
  
   get '/trainings/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :"/trainings/training_goal"
    end
  end

  post '/trainings' do
    if params[:name] == ""
      redirect to '/trainings/new'
    end
    @training = Goal.new(training: params[:name])
    @goal.save

    redirect to "/trainings"
  end
    
    


end