require 'mechanize'

agent = Mechanize.new
current_page = agent.get("https://www.city.yokohama.lg.jp/business/bunyabetsu/gomi-recycle/sangyo/haishutsu/2020kouhyou-seizou.html")
elements = current_page.search(".top a")
        
elements.each do |ele|
    puts ele.inner_text
end

links.each do |link|
    puts "https://www.city.yokohama.lg.jp/business/bunyabetsu/gomi-recycle/sangyo/haishutsu/" + link
end