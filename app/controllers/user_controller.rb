class UserController < ApplicationController

get "/signup" do
  erb :"users/signup"
end

get "/login" do
  erb :"users/login"
end


get "/:username/dashboard" do
  erb :"users/dashboard"
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
