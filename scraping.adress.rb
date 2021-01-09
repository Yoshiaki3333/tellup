require 'mechanize'

agent = Mechanize.new
page = agent.get("https://www.google.com/maps/search/%E5%86%B7%E5%87%8D%E5%86%B7%E8%94%B5%E5%BA%AB%E8%A3%BD%E9%80%A0%E3%80%80%E6%84%9B%E7%9F%A5%E7%9C%8C/@35.17486,136.8839496,14z")
elements = page.search("span")
puts elements