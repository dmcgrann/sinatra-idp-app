class GoalsController < ApplicationController
  
  get '/goals' do
    if logged_in?
      @user = current_user
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
    if params[:name] == ""
      redirect to '/goals/new'
    end
    @goal = Goal.new(name: params[:name])
    @goal.user_id = current_user.id
    @goal.save
    redirect to "/goals"
  end
  
  get '/goals/:id' do
    if logged_in?
      @goal = Goal.find_by_id(params[:id])
      erb :"/goals/show_goal"
    else
      redirect '/login'
    end
  end

  get '/goals/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @goal = Goal.find_by_id(params[:id])
      if @goal && @goal.user == current_user
        erb :'/goals/edit_goal'
      else
        redirect '/goals'
      end
    end
  end

  patch '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    @goal.update(name: params[:name])
    @goal.save 
    redirect to "/goals/#{@goal.id}"
  end
  
  
end