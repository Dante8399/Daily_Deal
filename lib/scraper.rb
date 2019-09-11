require "open-uri"
require "nokogiri"
require "pry"

html = open("https://www.fws.gov/endangered/news/index.html")
NOKOGIRI::HTML(html)
doc = NOKOGIRI::HTML(html)
binding.pry
