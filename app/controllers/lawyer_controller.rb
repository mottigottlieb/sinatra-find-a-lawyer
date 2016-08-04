require 'nokogiri'
require 'open-uri'
require 'pry'


class LawyerController < ApplicationController

  get "/:user/lawyer_search" do
    erb :"lawyers/lawyer_search"
  end

  get "/lawyer_search" do
    @location = params[:location]
    @legal = params[:legal]
    @new_scrape = Scrape.new
    @lawyers = @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=#{@legal}&loc=#{@location}&button=")
    erb :"lawyers/lawyer_results"
  end

  get "/lawyer_results" do
    @total = params[:amount]
    @location = params[:location]
    @legal = params[:legal]
    @amt = @total.to_i
    @show = Lawyer.all.last(@amt.to_i)
    erb :"lawyers/lawyer_results"
  end


  post "/save" do
    @array = params[:law]
    @lawyer_id = params[:law].to_i
    redirect "/relate?selected_lawyer_id=#{@lawyer_id}"
  end

  get "/relate" do
    "selected lawyer id"
    @selected = params[:selected_lawyer_id].to_i
    @find = Lawyer.find_by(id: @selected)
    @user = User.find_by_id(session[:user_id])

    if @user.lawyers << @find
      redirect "#{@user.username}/dashboard"
    else
        "There was an issue Saving the Lawyer"
    end
  end

  get "/lawyer/:id" do
    l_id = params[:id].to_i
    @find = Lawyer.find_by(id: l_id)

    erb :"lawyers/lawyer_details"
  end


  post "/remove_lawyer" do
      @user = User.find_by_id(session[:user_id])
      @user.lawyers.all.find(params[:id].to_i).delete

      redirect "#{@user.username}/dashboard"
    end


  post "/login_results" do
    user = User.find_by(:username => params[:username])
    if user &&  user.authenticate(params[:password])
      session[:user_id] = user.id
      @location = params[:location]
      @legal = params[:legal]
      @new_scrape = Scrape.new
      @get = @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=#{@legal}&loc=#{@location}&button=")
      @amount = @get.size
      @amount_to_params = params[:amount] = @get.size

      redirect "/lawyer_results?amount=#{@amount}"
    else
      redirect "/"
      end
    end

end
