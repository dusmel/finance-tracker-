class UsersController < ApplicationController
  


  def my_portofolio
    @user = current_user
    @user_stocks = @user.stocks
  end

  def search
    if params[:key_word].blank?
      flash.now[:danger] = "You have passed an empty search"
      @friends = []
    else
      @friends = User.search(params[:key_word])
      # remove current user from result
      @friends = except_current_user(@friends)
      flash.now[:danger] = "Nothing found with your search try again" if @friends.empty?
    end

    respond_to do |format|
      format.js { render partial: 'users/friendship_result' }
    end
  end

  def my_friends
    @my_friends = current_user.friends
  end


  def show
    @user = User.find(params[:id])
    @user_stock = @user.stocks
  end

  private
  def except_current_user(friends)
    friends.reject {|user| user.email == current_user.email}
  end
end
