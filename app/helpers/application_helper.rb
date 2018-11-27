module ApplicationHelper


  def stock_already_added?(stock_ticker)
    user = current_user
    stock_added = user.stocks.find_by(ticker: stock_ticker)
    return true if stock_added
  end
  
end
