require 'open-uri'
require 'nokogiri'

url = 'https://www.cnn.com/specials/last-50-stories'
html = open(url)
html_parsed = Nokogiri::HTML(html)

news_array = []
news = html_parsed.css('h3.cd__headline')
news.each do |item|
    data = {}

    link = item.css('a')[0]["href"]
    next if link.include?('video')
    data[:link] = link = "https://www.cnn.com#{link}"

    title = item.css('span.cd__headline-text')[0].text
    data[:title] = title

    item_page = Nokogiri::HTML(open(link))
    item_author = item_page.css('.metadata__byline__author')
    if item_author.length != 0
        data[:author] = item_author[0].text 
    else 
        data[:author] = 'CNN'
    end
    print "news added to file \n"
    news_array.push(data)
end

res_data_to_file = ''

news_array.each do |item|
    str = item[:title]
    str += "\n(#{item[:link]})\n"
    str += "#{item[:author]}\n\n"

    res_data_to_file += str
end

time = Time.now
File.write("#{time.to_s[0..-6]}", res_data_to_file)