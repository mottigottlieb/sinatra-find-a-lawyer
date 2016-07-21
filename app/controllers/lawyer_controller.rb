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


end
