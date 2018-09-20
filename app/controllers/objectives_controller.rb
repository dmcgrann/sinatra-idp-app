class ObjectivesController < ApplicationController
  
  get '/objectives' do
    if logged_in?
      erb :"/objectives/objectives"
    else
      redirect '/login'
    end
  end
  
  get '/objectives/new' do
    if logged_in? && current_user
      erb :"/objectives/create_objective"
    else
      redirect to "/login"
		end
  end

  post '/objectives' do
    if params[:content] == ""
      redirect to '/objectives/new'
    end
    Objective.create(params)
    redirect to "/objectives"
  end
  
  get '/objectives/:id' do
    if logged_in?
      @objective = Objective.find_by_id(params[:id])
      erb :"/objectives/show_objective"
    else
      redirect '/login'
    end
  end
  
  get '/objectives/:id/edit' do
    if logged_in? && current_user
      @objective = Objective.find_by_id(params[:id])
      erb :'/objectives/edit_objective'
    else
      redirect '/login'
    end
  end
  
  patch '/objectives/:id' do
    @objective = Objective.find_by_id(params[:id])
    @objective.update(content: params[:content], deadline: params[:deadline])
    @objective.save
    redirect "/objectives/#{@objective.id}"
  end
  
  delete '/objectives/:id/delete' do
    if logged_in? && current_user
			@objective = Objective.find_by(params[:id])
			@objective.destroy
      redirect "/objectives"
    else
      redirect to "/login"
    end
  end
  
end