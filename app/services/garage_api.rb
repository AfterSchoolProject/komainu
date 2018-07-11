require 'faraday'

# The api that controls the garage
class GarageAPI
  HOST = ENV['GARAGE_API_HOST'] || 'http://localhost:5000/'

  def open
    url = URI.join(HOST, 'open')
    Faraday.get(url)
  end
end
