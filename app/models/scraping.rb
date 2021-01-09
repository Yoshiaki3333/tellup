class Scraping
    def self.company_urls
        links = []
        agent = Mechanize.new
        current_page = agent.get("https://job.rikunabi.com/2021/s/8_0________/")
        elements = current_page.search(".ts-h-search-cassetteTitle a")
        
        elements.each do |ele|
            links << ele[:href]
        end
        
        links.each do |link|
            get_company("https://job.rikunabi.com" + link)
        end
    end
    
    def self.get_company(link)
        agent = Mechanize.new
        page = agent.get(link)
        name = page.at(".ts-h-company-mainTitle a").inner_text
        industry = page.at(".ts-h-company-dataTable-main").inner_text
        adress = page.at(".")
        
        company = Company.where(name: name, industry: industry).first_or_initialize
        company.save
    end
end