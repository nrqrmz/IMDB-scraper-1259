require 'open-uri'
require 'nokogiri'

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

def top_movies
  url = "https://www.imdb.com/chart/top"
  html_file = URI.open(url).read
  html_doc =  Nokogiri::HTML.parse(html_file)

  html_doc.search('.titleColumn > a')[0..4].map do |url|
    "https://www.imdb.com#{url['href']}"
  end
end

def movie_data(url)
  html_file = URI.open(url, 'Accept-Language' => 'en-US', 'User-Agent' => USER_AGENT).read
  html_doc = Nokogiri::HTML.parse(html_file)

  title = html_doc.search('h1').text
  year = html_doc.search('.ipc-inline-list a')[3].text.to_i
  storyline = html_doc.search('.sc-5f699a2-2.cxqNYC').text
  director = html_doc.search('.ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link')[0].text
  cast = html_doc.search(".ipc-metadata-list__item.ipc-metadata-list-item--link:contains('Stars') a").map do |line|
    line.text
  end[1...4]
  
  {
    title: title,
    cast: cast,
    year: year,
    director: director,
    storyline: storyline
  }
end
