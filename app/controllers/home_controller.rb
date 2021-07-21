class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Grab News Data
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)
  end

  def prices
    require 'net/http'
    require 'json'
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase

      # Grab Prices Data
      @quote_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' + @symbol + '&tsyms=EUR'
      @quote_uri = URI(@quote_url)
      @quote_response = Net::HTTP.get(@quote_uri)
      @quote = JSON.parse(@quote_response)
    end
  end
end
