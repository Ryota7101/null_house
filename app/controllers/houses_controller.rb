class HousesController < ApplicationController
  #空き家
  
  helper_method :lm
  
  def index
    @houses = House.all.search(params[:search])
  end

  def show
    #付けられたコメントやオファーも表示
    @house = House.find(params[:id])
    @user  = User.find_by(id:@house.user_id)
    @comments = @house.comments
    @comment = Comment.new
    @offer = Offer.find_by(house_id:@house.id)
  end

  def edit
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end
  
  def destroy
    House.find(params[:id]).destroy
    flash[:success] = "空き家を削除しました"
    redirect_to houses_url
  end
  
  def update
    @house = House.find(params[:id])
    if @house.update_attributes(house_params)
      flash[:success] = "空き家のプロフィールを更新しました"
      redirect_to @house
    else
      render 'edit'
    end
  end
  
  def create
    @house = current_user.houses.create(house_params)
    ##@house = House.new(house_params)
    if @house.save # => Validation
      flash[:success] = "登録成功だっちゃ"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
  
  def lm(x1,x2,x3,x4,x5)
    #空き家の価格を予測して表示
   (27073 + 4.82355928*x1 - 1097.43589744*x2 + 1625.64102564*x3  - 48.23559279*x4 - 2076.92307692*x5).to_i
  end

  private

    def house_params
      params.require(:house).permit(:title, :overview,:layout,:price,:land_area,
      :building_area,:age_of_a_building,:adoress)
    end

end
