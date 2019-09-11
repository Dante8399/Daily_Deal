require "open-uri"
require "nokogiri"
require "pry"

html = open("https://www.fws.gov/endangered/news/index.html")
doc = Nokogiri::HTML(html)
binding.pry

#articles: doc.css("div.article")
#title: doc.css("h2").text
#date: doc.css("p.dateline").text

class E_Species
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

end


