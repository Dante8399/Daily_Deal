require "open-uri"
require "nokogiri"
require "pry"



#articles: doc.css("div.article")
#title: doc.css("h2").text
#date: doc.css("p.dateline").text

class Article
  @@all = []
  attr_accessor :title, :date, :url, :news_sub_title
  
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

  


