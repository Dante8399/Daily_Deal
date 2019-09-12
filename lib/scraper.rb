require "open-uri"
require "nokogiri"
require "pry"



#articles: doc.css("div.article")
#title: doc.css("h2").text
#date: doc.css("p.dateline").text

class Article
  @@all = []
  attr_accessor :title, :date, :url
  
  def initialize (title,date,url)
  @title = title
  @date = date
  @url = url
  @@all << self
end

  def self.all
  @@all
end

end

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
  
  #In the list of articles array, opens page to provided url for scraping
  Article.all.each do |article|
    doc = Nokogiri::HTML(open(article.url))
    #add method to the Article class that represents a variable for some element scraped on this page
    #Call the method (Article.whatever) and set it equal to the element on this page
    binding.pry
  end
  

  
binding.pry






  
  
  


