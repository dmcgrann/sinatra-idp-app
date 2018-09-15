class GoalsController < ApplicationController
  
  get '/goals' do
    if logged_in?
      @user = current_user
      @goals = Goal.all
      erb :"/goals/goals"
    else
      redirect '/login'
    end
  end
  
   get '/goals/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :"/goals/create_goal"
    end
  end

  post '/goals' do
    if params[:content] == ""
      redirect to '/goals/new'
    end
    @goal = Goal.new(content: params[:content])
    @goal.user_id = current_user.id
    @goal.save

    redirect to "/goals"
  end
  
  
end