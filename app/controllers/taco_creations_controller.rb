class TacoCreationsController < ApplicationController

    # get taco_creations/new to render a form to create new 
    get '/taco_creations/new' do
        erb :'taco_creations/new'
    end

    # post taco_creations to create a new taco creation
    post '/taco_creations' do
        # raise params.inspect

        # I want to create a new taco creation and save it to the DB
        # I only want to save the entry if it has some content
        if !logged_in?
            redirect '/'
        end
        # I also only want to create a taco creation if a user is logged in
        if params[:content] != ""
            #create a new entry
            @taco_creation = TacoCreation.create(creation: params[:creation], user_id: current_user.id)
            redirect "/taco_creations/#{@taco_creation.id}"
        else
            redirect '/taco_creations/new'
        end
    end

    # show route for a taco creation
    get '/taco_creations/:id' do
        @taco_creation = TacoCreation.find(params[:id])
        erb :'/taco_creations/show'
    end

    # this route should send us to taco_creations/edit.erb which will render an edit form
    get '/taco_creations/:id/edit' do
        erb :'/taco_creations/edit'
    end

    # index route for all taco creations

end