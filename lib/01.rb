require 'rubygems'
require 'nokogiri'  
require 'open-uri' 
require 'rest-client'



prix = []
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
doc.xpath('//td[5]/a').each do |i|
	prix << i.text
	end 

id = []
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
doc.xpath('//td[2]/a').each do |x|
	id << x.text
	end 

result = id.zip(prix).to_h
puts result

