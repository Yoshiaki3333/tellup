require 'mechanize'

links = []
agent = Mechanize.new
current_page = agent.get("")
elements = current_page.search(".top a")
        
elements.each do |ele|
    links << ele[:href]
end

links.each do |link|
    puts "https://www.city.yokohama.lg.jp/business/bunyabetsu/gomi-recycle/sangyo/haishutsu/" + link
end