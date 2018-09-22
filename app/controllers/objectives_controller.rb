class ObjectivesController < ApplicationController
  
  get '/objectives' do
    redirect_if_not_logged_in
    erb :"/objectives/objectives"
  end
  
  get '/objectives/new' do
    redirect_if_not_logged_in
    erb :"/objectives/create_objective"
  end

  post '/objectives' do
    redirect_if_not_logged_in
    if params[:content] == ""
      redirect "/objectives/new?error=must be a valid objective"
    end
    @objective = Objective.new(content: params[:content], deadline: params[:deadline], goal_id: params[:goal_id])
    @objective.save
    redirect to "/objectives"
  end
  
  get '/objectives/:id' do
    redirect_if_not_logged_in
    @objective = Objective.find_by_id(params[:id])
    erb :"/objectives/show_objective"
  end
  
  get '/objectives/:id/edit' do
    redirect_if_not_logged_in
    @objective = Objective.find_by_id(params[:id])
    erb :'/objectives/edit_objective'
  end
  
  patch '/objectives/:id' do
    redirect_if_not_logged_in
    @objective = Objective.find_by_id(params[:id])
    if params[:content] == "" || !current_user
      redirect "/objectives?error=invalid entry"
    else
      @objective.update(content: params[:content], deadline: params[:deadline])
      @objective.save
      redirect "/objectives/#{@objective.id}"
    end
  end
  
end