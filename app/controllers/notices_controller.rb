class NoticesController < ApplicationController
  before_action :ensure_correct_user, {only: [:index, 
                                              :show,
                                              :new,
                                              :create]}
  
  def index
    @notices = Notice.all
  end
  
  def show
    @notice = Notice.find(params[:id])
  end
  
  def new
    @notice = Notice.new
  end
  
  def create
    @notice = Notice.new(notice_params)
    if @notice.save # => Validation
      # Sucess
      flash[:success] = "運営からのお知らせを作成しました"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
  
  def ensure_correct_user
    if current_user.admin?
      #何もしない
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end
  
  private

    def notice_params
      params.require(:notice).permit(:title, :content)
    end
  
end
