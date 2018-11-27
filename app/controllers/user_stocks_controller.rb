class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end 
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "stock #{stock.name} was successfully added to your portofolio"
    redirect_to myportofolio_path
  end

  def destroy
    user_stock = UserStock.find_by(user: current_user, stock: params[:id])
    user_stock.delete
    redirect_to myportofolio_path
  end
end
