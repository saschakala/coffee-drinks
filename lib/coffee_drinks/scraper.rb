class Scraper

    DRINK_URL = "https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html"
    PASTRY_URL = "https://www.insider.com/best-german-desserts-2017-3"
    TEA_URL = "https://www.webstaurantstore.com/guide/693/types-of-tea.html"

    def self.scrape_drinks
        doc = Nokogiri::HTML(open(DRINK_URL))
        doc.css("div.blog-highlight-wrap").each do |drink|
            name = drink.css("h3").text.strip
            ratio_cup = drink.css("li.icon-check")
            milk = if ratio_cup.text.include?("milk") || ratio_cup.text.include?("foam")|| ratio_cup.text.include?("cream") == true
                "yes"
            else
                "no"
            end
            description = drink.css("p").text
            ratio = drink.css("li.icon-check")[0].text.strip
            cup = drink.css("li.icon-check")[1].text.strip
            Drink.new(name, milk, description, ratio, cup)
        end
    end

    def self.scrape_pastries
        doc = Nokogiri::HTML(open(PASTRY_URL))
        doc.css("div.slide").each do |pastry|
            name = pastry.css("h2.slide-title-text").text.strip
            description = pastry.css("p").text.strip
            Pastry.new(name, description)
        end
    end

    def self.scrape_tea
        doc = Nokogiri::HTML(open(TEA_URL))
        doc.css("div.template-text").each do |tea|
            name = tea.css("b").text.strip
            description = tea.css("p")[2].text.strip
            flavor = tea.css("p")[3].text.strip
            varieties = tea.css("p")[4].text.strip
            Tea.new(name, description, flavor, varieties)
        end
        
    end

end