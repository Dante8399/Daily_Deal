require "open-uri"
require "nokogiri"
require "pry"



#articles: doc.css("div.article")
#title: doc.css("h2").text
#date: doc.css("p.dateline").text

class Article
  @@all = []
  attr_accessor :title, :date, :url, :description, :news_sub_title
  
  def initialize (title,date,url,description)
    @title = title
    @date = date
    @url = url
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

end

  


