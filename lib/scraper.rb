require "open-uri"
require "nokogiri"
require "pry"



#articles: doc.css("div.article")
#title: doc.css("h2").text
#date: doc.css("p.dateline").text

class Article
  @@all = []
  attr_accessor :title, :date
  
  def initialize (title,date)
  @title = title
  @date = date
  @@all << self
end

  def self.all
  @@all
end



html = open("https://www.fws.gov/endangered/news/index.html")
doc = Nokogiri::HTML(html)

article_elements = doc.css("div.article")



article_elements.each do |article_el|
  Article.new(
    article_el.css("h2").text, 
    article_el.css("p.dateline").text
    )
  end

  
binding.pry






  
  
  


