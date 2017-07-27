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


######## Post requests

post "/signup" do
  # Create new user
  user = User.create(:username => params[:username], :password => params[:password], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name])
  if user.save
    #set session to this user
    session[:user_id] = user.id
    redirect "#{user.username}/dashboard"
  else
    "not saved"
  end
end

post "/login" do
  #find user in db
  user = User.find_by(:username => params[:username])
  # if exists and can auth password
  if user &&  user.authenticate(params[:password])
      # set session
      session[:user_id] = user.id
      #redirect to dashboard
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
  session.clear
  redirect "/logout"
end
end
