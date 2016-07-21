class UserController < ApplicationController

get "/signup" do
  erb :"users/signup"
end

get "/login" do
  erb :"users/login"
end


get "/:username/dashboard" do
   if logged_in?
     erb :"users/dashboard"
   else
     "You have to be logged in"
   end


end


######## Post requests

post "/signup" do
  # Create new user
  user = User.create(:username => params[:username], :password => params[:password])
  if user.save
    #set session to this user
    session[:user_id] = user.id
    redirect "#{user.username}/dashboard"
  else
    "not saved"
  end

end
end
