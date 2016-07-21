class UserController < ApplicationController

get "/signup" do
  erb :"users/signup"
end

get "/login" do
  erb :"users/login"
end



######## Post requests

post "/signup" do
  # Create new user
  user = User.create(:username => params[:username], :password => params[:password])
  if user.save
    #set session to this user
    session[:user_id] = user.id
    "saved"
  else
    "not saved"
  end

end
end
