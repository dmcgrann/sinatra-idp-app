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
  
end