class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Grab News Data
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    # Grab Prices Data
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,XRP,BCH,EOS,LTC,ADA,XLM,MIOTA,USDT,TRX,SHIB&tsyms=EUR'
    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)

  end

  def prices
  end
end
