require 'nokogiri'
require 'open-uri'
require 'pry'


class LawyerController < ApplicationController

  get "/:user/lawyer_search" do
    erb :"lawyers/lawyer_search"
  end

  post "/lawyer_search" do
    "Searching..."
  end
  get '/search_for_a_lawyer' do
    @new_scrape = Scrape.new
    @new_scrape.scrape_page("https://www.avvo.com/search/lawyer_search?utf8=%E2%9C%93&q=traffic&loc=11225&button=")
    "hello"
  end


end
