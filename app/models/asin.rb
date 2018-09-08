class Asin
  AMAZON_BASE_URL = 'https://amazon.com/dp/'

  def self.get_response_code(asin)
    url = "#{AMAZON_BASE_URL}#{asin}"
    response = HTTP.get(url)
    if response.code == 301
      response = HTTP.get(response.headers['location'])
    end
    response.code
  end
end
