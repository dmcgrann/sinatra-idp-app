class GoalsController < ApplicationController
  
  get '/goals' do
    redirect_if_not_logged_in
    @goals = Goal.all 
    erb :"/goals/goals"
  end
  
  get '/goals/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :"/goals/create_goal"
  end

  post '/goals' do
    redirect_if_not_logged_in
    
    if params[:name] == ""
      redirect "/goals/new?error=must be a valid goal"
    end
    @goal = Goal.new(name: params[:name])
    @goal.user_id = current_user.id
    @goal.save
    redirect to "/goals"
  end
  
  get '/goals/:id' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @goal = Goal.find_by_id(params[:id])
    erb :"/goals/show_goal"
  end

  get '/goals/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @goal = Goal.find_by_id(params[:id])
    erb :'/goals/edit_goal'
  end

  patch '/goals/:id' do
    redirect_if_not_logged_in
    @goal = Goal.find_by_id(params[:id])
    if params[:name] == ""
      redirect "/goals?error=a goal cannot be blank"
    end
    @goal.update(name: params[:name])
    @goal.user_id = current_user.id
    @goal.save 
    redirect to "/goals/#{@goal.id}"
  end
  
  delete '/goals/:id/delete' do
    redirect_if_not_logged_in
    @goal = Goal.find_by(params[:id])
    if params[:name] == ""
      redirect "/goals"
    end
    @goal.destroy
    redirect "/goals"
  end
  
end