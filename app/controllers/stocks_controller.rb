class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have passed an empty search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered a wrong symbol try again" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
    
  end
  
end
