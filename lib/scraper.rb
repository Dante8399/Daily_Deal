require "open-uri"
require "nokogiri"
require "pry"

html = open("https://www.fws.gov/endangered/news/index.html")
Nokogiri::HTML(html)
doc = Nokogiri::HTML(html)
binding.pry
