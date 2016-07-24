require 'nokogiri'
require 'open-uri'
require 'pry'


class LawyerController < ApplicationController

  get "/:user/lawyer_search" do
    erb :"lawyers/lawyer_search"
  end

  post "/lawyer_search" do
    #grab location
    @location = params[:location]
    # grab issue
    @legal = params[:legal]
    @new_scrape = Scrape.new
    @get = @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=#{@legal}&loc=#{@location}&button=")
    @amount = @get.size
    @amount_to_params = params[:amount] = @get.size

    redirect "/lawyer_results?amount=#{@amount}"
  end

  get "/lawyer_results" do
    @total = params[:amount]

    @amt = @total.to_i
    @show = Lawyer.all.last(@amt.to_i)
    # binding.pry
    erb :"lawyers/lawyer_results"
  end


  post "/save" do

    @lawyer_id = params[:law].to_i
    redirect "/relate?selected_lawyer_id=#{@lawyer_id}"


    # lawyer = Lawyer.find_by(@lawyer_id)
    #   @selected = params[:lawyer_selected]
    #
    #   "e"
  end

    get "/remove_lawyer" do

    end
    get "/relate" do
      "selected lawyer id"
      @selected = params[:selected_lawyer_id].to_i
      @find = Lawyer.find_by(id: @selected)
      @user = User.find_by_id(session[:user_id])

    if   @user.lawyers << @find
      "saved "
    else
      "not"
    end

      # "se #{@find.name}, id #{@find.id}:::user #{@user.lawyers.map {|a| a.name}} f "
    end

    get "/lawyer/:id" do

      l_id = params[:id].to_i
      @find = Lawyer.find_by(id: l_id)


      erb :"lawyers/lawyer_details"

    end


    post "/remove_lawyer" do
        @lawyer_id = params[:id].to_i
        redirect "/remove_lawyer?id=#{@lawyer_id}"

    end

    get "/remove_lawyer" do
      l_id = params[:lawyer_id].to_i
      @user = User.find_by_id(session[:user_id])
      user_lawyers = @user.lawyers.all
      binding.pry
      user_lawyers.find_by(id: l_id).delete
    end

end
