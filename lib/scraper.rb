class Scraper

# Scrapes initial page and returns list of articles as an array, assigned to article_elements variable  
  def self.scrape_article_list
    html = open("https://www.fws.gov/endangered/news/index.html")
    doc = Nokogiri::HTML(html)

    article_elements = doc.css("div.article")


# Iterates over article elements array, creating a new Article instance for each and assigning a title, date, and url with the below values. Saves to article_elements
    article_elements.each do |article_el|
      Article.new(
        article_el.css("h2").text, 
        article_el.css("p.dateline").text,
        article_el.css("a").attr('href').value
      )
    end
  end
  # article_elements array with updated values
  
  # This next method operates on article_elements array, assigning each article to the 'article' variable and iterating over it
  # Scrapes landing page from url, assigns subtitle from page to news_sub_title variable in Article class
  def self.scrape_article(article)
    doc = Nokogiri::HTML(open(article.url))
    article.news_sub_title = doc.css('div.NewsSubTitle').text
    #add method to the Article class that represents a variable for some element scraped on this page
    #Call the method (article.whatever) and set it equal to the element on this page
  end
  
end