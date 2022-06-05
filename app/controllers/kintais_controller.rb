class KintaisController < ApplicationController
  
  def index
    @users = User.all
  end

  def create
    @kintai = Kintai.new(kintai_params)
    case params[:commit]
      when "出勤" ; session[:start_time] = Time.now
      when "退勤" ; session[:end_time] = Time.now
    end
    if session[:start_time] != nil && session[:end_time] != nil
      @kintai[:start_time] = session[:start_time]
      @kintai[:end_time] = session[:end_time]
      @kintai.save
      session[:start_time] = nil
      session[:end_time] = nil
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end

private

  def kintai_params
    params.permit(:start_time, :end_time).merge(user_id: current_user.id)
  end
