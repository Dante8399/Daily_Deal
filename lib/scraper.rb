require "open-uri"
require "nokogiri"
require "pry"

html = open("www.fws.gov")
Nokogiri::HTML(html)
doc = Nokogiri::HTML(html)
binding.pry
