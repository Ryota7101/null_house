class FavoritesController < ApplicationController
  def create
    house = House.find(params[:house_id])
    current_user.favorite(house)
    flash[:success] = 'お気に入り登録しました'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    house = House.find(params[:house_id])
    current_user.unfavorite(house)
    flash[:success] = 'お気に入り登録を解除しました'
    redirect_back(fallback_location: root_path)
  end
end
