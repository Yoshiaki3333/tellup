require 'mechanize'

links = []
agent = Mechanize.new
current_page = agent.get("https://baseconnect.in/search/companies?prefecture%5B%5D=e010a2b6-a345-4a52-b350-1ca592e384b8&prefecture%5B%5D=60622468-79bd-4eef-86f8-cb69d1ef09f0&keyword=e72f6dfd-d0e6-4cd1-b48c-3ee50d980208")
elements = current_page.search(".searches__result__list__header__title a")
        
elements.each do |ele|
    links << ele[:href]
end

links.each do |link|
   puts ("https://baseconnect.in/" + link)
end

# ---------------------------------------------------
require 'mechanize'

def scraping_image
    agent = Mechanize.new
    page = agent.get(link)
    image_url = page.at(".entry-content img")
    return image_url
end

elements.each do |ele|
    puts ele[:src]
end

links = []

agent = Mechanize.new
current_page = agent.get("http://review-movie.herokuapp.com/")
elements = current_page.at(".entry-title a")

elements.each do |ele|
    links << ele[:href]
end

links.each do |link|
    puts scraping_image("http://review-movie.herokuapp.com" + link)
end

