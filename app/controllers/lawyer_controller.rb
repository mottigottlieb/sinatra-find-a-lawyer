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
    @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=#{@legal}&loc=#{@location}&button=")
    binding.pry
  end
 


end
