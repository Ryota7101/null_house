class AdminsController < ApplicationController
  before_action :ensure_correct_user, {only: [:houses, 
                                              :users,
                                              :comments,
                                              :reservations,
                                              :datavisualizations]}
  
  def users
    @users = User.all
  end

  def houses
    @houses = House.all
  end
  
  def comments
  end
  
  def reservations
  end
  
  def datavisualizations 
    @users = User.pluck('premium')
  end
  
  def ensure_correct_user
    if current_user.admin?
      #何もしない
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end

end
