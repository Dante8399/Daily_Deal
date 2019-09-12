class Scraper
  
  def self.scrape_article_list
    html = open("https://www.fws.gov/endangered/news/index.html")
    doc = Nokogiri::HTML(html)

    article_elements = doc.css("div.article")


# article_el is the the actual article element (1 of 12) in the array. The css in this method is working on it just as we defined above when pulling specific classes
    article_elements.each do |article_el|
      Article.new(
        article_el.css("h2").text, 
        article_el.css("p.dateline").text,
        article_el.css("a").attr('href').value
      )
    end
  end
  
  
  def self.scrape_article(article)
    doc = Nokogiri::HTML(open(article.url))
    article.news_sub_title = doc.css('div.NewsSubTitle').text
    #add method to the Article class that represents a variable for some element scraped on this page
    #Call the method (article.whatever) and set it equal to the element on this page
  end
  
end