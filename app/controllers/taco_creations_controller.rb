class TacoCreationsController < ApplicationController

    get '/taco_creations' do
        @taco_creations = TacoCreation.all
        erb :'taco_creations/index'
    end

    get '/taco_creations/new' do
        erb :'taco_creations/new'
    end

    post '/taco_creations' do

        if !logged_in?
            redirect '/'
        end

        if params[:creation] != ""
            @taco_creation = TacoCreation.create(creation: params[:creation], user_id: current_user.id)
            redirect "/taco_creations/#{@taco_creation.id}"
        else
            redirect '/taco_creations/new'
        end
    end

    get '/taco_creations/:id' do
        set_taco_creation
        erb :'/taco_creations/show'
    end

    get '/taco_creations/:id/edit' do
        set_taco_creation
        if logged_in?
            if authorized_to_edit?(@taco_creation)
                erb :'/taco_creations/edit'
            else   
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/taco_creations/:id' do
        set_taco_creation
        if logged_in?
            if authorized_to_edit?(@taco_creation) && params[:creation] != ""
                @taco_creation.update(creation: params[:creation])
                redirect "/taco_creations/#{@taco_creation.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    delete '/taco_creations/:id' do
        set_taco_creation
        if authorized_to_edit?(@taco_creation)
            @taco_creation.destroy
            redirect 'taco_creations'
        else
            redirect 'taco_creations'
        end
    end

    private

    def set_taco_creation
        @taco_creation = TacoCreation.find(params[:id])
    end

end