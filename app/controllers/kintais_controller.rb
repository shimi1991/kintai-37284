class KintaisController < ApplicationController
  
  def index
    @users = User.all
  end

  def create
    @kintai = Kintai.new(kintai_params)
    case params[:commit]
      when "出勤" ; @kintai.start_time = Time.now
      when "退勤" ; @kintai.end_time = Time.now
    end
    if @kintai.save
      redirect_to root_path
    else
#      redirect_to root_path
    end
  end

end

private

  def kintai_params
    params.permit(:start_time, :end_time).merge(user_id: current_user.id)
  end
