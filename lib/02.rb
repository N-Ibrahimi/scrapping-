require 'rubygems'
require 'nokogiri'  
require 'open-uri' 
require 'rest-client'



@index_of_95 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

add = []
@index_of_95.xpath('//p/a/@href').each do |urls|
	add << "#{urls}".sub('.',"http://annuaire-des-mairies.com")
	end 

add.each do |x|
	a = []
	Nokogiri::HTML(open(x)).xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |b|
		a << b.text
	end

result = a.zip(add).to_h
puts result
end 