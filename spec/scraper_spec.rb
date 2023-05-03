require_relative '../scraper'

describe '#top_movies' do
  it 'returns an array with top 5 movies urls' do
    movies_urls = top_movies
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(movies_urls).to eq(expected)
  end
end

describe '#movie_data' do
  it 'returns an array with all movie data' do
    the_dark_knight_url = 'https://www.imdb.com/title/tt0468569'
    dark_knight_data = movie_data(the_dark_knight_url)
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(dark_knight_data).to eq(expected)
  end
end
