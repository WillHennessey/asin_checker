require 'net/http'
require 'net/https'
class Asin
  AMAZON_BASE_URL = 'https://amazon.com/dp/'
  AGENT = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.85 Safari/537.36'

  def self.get_response_code(asin)
    url = "#{AMAZON_BASE_URL}#{asin}"
    uri = URI(url)
    result = get_response(uri)
    if result.code.to_i == 301
      uri = URI(result.header['location'])
      result = get_response(uri)
    end
    result.code.to_i
  end

  def self.get_response(uri)
    req = Net::HTTP::Get.new(uri)
    req['User-Agent'] = AGENT
    Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) { |http| http.request(req) }
  end
end
