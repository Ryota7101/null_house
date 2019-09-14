class AccountActivationsController < ApplicationController
  #アカウントを有効化する
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      # 有効化に成功した場合は、ログイン状態にしてユーザーページへリダイレクト
      user.activate
      log_in user
      flash[:success] = "アカウントを有効化しました"
      redirect_to user
    else
      # 有効化に失敗した場合
      flash[:danger] = "無効なリンクです"
      redirect_to root_url
    end
  end
end
