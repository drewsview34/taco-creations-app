class TacoCreationsController < ApplicationController

    # get taco_creations/new to render a form to create new 
    get '/journal_entries/new' do
        erb :'taco_creations/new'
    end

    # post taco_creations to create a new taco creation
    post '/taco_creations' do

    end

    # show page for a taco creation

    # index route for all taco creations

end