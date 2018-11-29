class UsersController < ApplicationController
  


  def my_portofolio
    @user = current_user
    @user_stocks = @user.stocks
  end

  def my_friends
    
  end
end
