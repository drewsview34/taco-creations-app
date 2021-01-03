class UsersController < ApplicationController

    # what routes do i need to login?
    # the purpose of this route is to render the login page (form)
    get '/login' do
        erb :login
    end


    # what routes do i need for signup?
    get '/signup' do'
        
    end

end