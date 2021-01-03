class UsersController < ApplicationController

    # what routes do i need to login?
    # the purpose of this route is to render the login page (form)
    get '/login' do
        erb :login
    end

    # the purpose of this route is to receive the login form,
    # find the user, and log the user in (create a session)
    post '/login' do
        # params looks like: {username: "username", password: "password"}
        # find the user
        @user = user.find_by(username: params[:username])

        # authenticate the user - verify the user is who they say they are
        # they have the credentials - email/password combo
        if @user.authenticate{params[:password]}
        # log the user in - create the user session
            session[:user_id] = @user.id
        # redirect to the user's landing page (show? index? dashboard?)
            redirect "users/#{{@user.id}}"
        else
        #tell the user they entered invalid credentials
        #redirect them to the login page

        end
    end


    # what routes do i need for signup?
    get '/signup' do
        
    end

    # user SHOW route
    get '/users/:id' do
        erb :show    
    end

end