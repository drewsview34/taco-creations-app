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
        @user = User.find_by(username: params[:username])

        # authenticate the user - verify the user is who they say they are
        # they have the credentials - email/password combo
        if @user.authenticate(params[:password])
        # log the user in - create the user session
            session[:user_id] = @user.id
        # redirect to the user's landing page (show? index? dashboard?)
            puts session
            redirect "users/#{@user.id}"
        else
        #tell the user they entered invalid credentials
        #redirect them to the login page

        end
    end


    # what routes do i need for signup?
    # this route's job is to render the signup form
    get '/signup' do
        # erb (render) a view
        erb :signup
    end

    post '/users' do
        #here is where we will create a new user and persist the new user to the DB
        #params will look like this:
        #{
        #"name"=>"name", 
        #"username"=>"username"
        #"password"=>"password"
        #}
        # I only want to persist a user that has a name, enmail, AND password
        if params[:name] != "" && params[:username] != "" && params[:password] != ""
            # valid input
            @user = User.create(params)
            #logging the user in
            session[:user_id] = @user.id
            #where do I go
            #let's go to the user show page
            redirect "/users/#{@user.id}"
        else
            # not valid input
            # it would be better to include a message to the user telling them what is wrong
            redirect '/signup'
        end
    end

    # user SHOW route
    get '/users/:id' do
        @user = User.find_by(id: params[:id])

        erb :'/users/show'
    end

    # get '/logout' do
    #     session.clear
    #     redirect '/'
    # end
    get '/logout' do
        session.clear
        redirect '/'
    end

end