class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have passed an empty search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      
      # if @stock is not an object therefore a string then it is an error message
      if !@stock.is_a?(Stock)
        flash.now[:danger] = "Internet  Lost" if @stock.include? "Internet"
        flash.now[:danger] = "Symbole not found try again" if @stock.include? "Symbole not found"
        @stock = nil
      end
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
    
  end
  
end
