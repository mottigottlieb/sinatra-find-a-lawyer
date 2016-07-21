class LawyerController < ApplicationController

  require 'pry'

  get '/search_for_a_lawyer' do
    @new_scrape = Scrape.new
    binding.pry
  end

end
