class UserController < ApplicationController

  get "/signup" do
    erb :"users/signup"
  end

  get "/login" do
    erb :"users/login"
  end


  get "/:username/dashboard" do
    @user = User.find_by_id(session[:user_id])
    @display_id = 1
    @modal_id = 1
     if logged_in?
       erb :"users/dashboard"
     else
       redirect "/"
     end
  end



  post "/signup" do
    user = User.create(params)
    if user.save
      session[:user_id] = user.id
      redirect "#{user.username}/dashboard"
    else
      redirect  "/"
    end
  end

post "/login" do
  user = User.find_by(:username => params[:username])
  if user &&  user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "#{user.username}/dashboard"
    else
      "We couldn't find you :("
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

  get '/:username/logout' do
    redirect "/logout"
  end
end
