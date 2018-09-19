class ObjectivesController < ApplicationController
  
  get '/objectives' do
    if logged_in?
      erb :"/objectives/objectives"
    else
      redirect '/login'
    end
  end
  
  get '/objectives/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :"/objectives/create_objective"
    end
  end

  post '/objectives' do
    if params[:content] == ""
      redirect to '/objectives/new'
    end
    Objective.create(params)
    redirect to "/objectives"
  end
  
  
  
end