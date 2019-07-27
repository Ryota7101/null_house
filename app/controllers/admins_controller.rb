class AdminsController < ApplicationController
  
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

end
