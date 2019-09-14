class FavoritesController < ApplicationController
  #houseに対してお気に入りをする機能
  
  def create
    house = House.find(params[:house_id])
    current_user.favorite(house)
    flash[:success] = 'お気に入り登録しました'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    house = House.find(params[:house_id])
    current_user.unfavorite(house)
    flash[:success] = 'お気に入り登録を解しました'
    redirect_back(fallback_location: root_path)
  end
end
