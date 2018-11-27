class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :users, through: :user_stocks
  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new( ticker: looked_up_stock.symbol, name: looked_up_stock.company_name, last_price: looked_up_stock.latest_price)
    rescue => exception
      if exception.to_s.include?("TCP connection")
        return "Internet connection lost"
      else
        return "Symbole not found try again"
      end
    end
  end
    
end
