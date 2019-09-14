class CommentsController < ApplicationController
  #houseページへのコメント機能

  
  def create
    #現在のユーザーとコメントを紐つける
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    house = House.find(params[:house_id])
    #コメントがどのhouseにつけられたか
    @comment.house_id = house.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
