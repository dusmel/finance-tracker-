class FriendshipsController < ApplicationController

  def new
    new_friend = User.find(params[:friend])
    current_user.friends << new_friend unless !!current_user.already_friend?(new_friend)
    redirect_to friendship_path
  end
  
  def unfriend
    friendship = Friendship.find_by(user: current_user, friend: params[:id])
    friendship.delete
    redirect_to friendship_path
  end


end
