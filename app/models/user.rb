class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  def full_name 
    return "#{first_name} #{last_name}".capitalize if (first_name || last_name)
    "Anonymous"
  end

  def stock_already_added?(stock_ticker)
    stock = Stock.find_by(ticker: stock_ticker)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end 

  def under_stock_limit?
      (user_stocks.count < 10)
  end

  def can_add_stock?(stock_ticker)
    !stock_already_added?(stock_ticker) && under_stock_limit?
  end
  
end
