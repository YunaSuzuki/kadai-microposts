class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  #model fileに書かれているmethodを用いて、実際にfollow, unfollowを実行

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)  
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to user
  end
end
