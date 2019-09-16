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
        article_el.css("a").attr('href').value,
        article_el.css("div.content p").text
      )
    end
  end
  # article_elements array with updated values
  
  
  def self.scrape_article(article)
    doc = Nokogiri::HTML(open(article.url))
    article.news_sub_title = doc.css('div.press-release-body p')[0].text
  end
  
end