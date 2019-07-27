class NoticesController < ApplicationController
  
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
      flash[:success] = "運営からのお知らせを作成したぞ"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
  
  
  
  private

    def notice_params
      params.require(:notice).permit(:title, :content)
    end
  
end
