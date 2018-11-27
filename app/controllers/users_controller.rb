class UsersController < ApplicationController
  


  def my_portofolio
    @user = current_user
    @user_stocks = @user.stocks
  end
end
