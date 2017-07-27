require 'nokogiri'
require 'open-uri'
require 'pry'
class Scrape

  def scrape_page(index_url)
    #scrape avvo.com
    site = @doc = Nokogiri::HTML(open(index_url))
    site.search("div.lawyer-search-result").map do |info| 
        time = Time.now

          l_name = info.search("div h3").text if info.search("div h3") != ""
          l_practice = info.search("p.text-truncate").text.slice(25..400)  if info.search("p.text-truncate") != ""
          l_rating = info.search("span.text-nowrap strong").text 
          l_years =  info.search("time").text.delete("since ").to_i
          l_number = info.search("span.hidden-xs").text
          l_time = time.year-l_years
          # check if l_name is not blank          
          # binding.pry
          law = Lawyer.create(name: l_name, practice: l_practice, rating: l_rating, years: l_time, number: l_number)
          # i want it not to save if name == 

           law.save!   
 
             
        end
  end

end



