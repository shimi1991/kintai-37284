class KintaisController < ApplicationController
  
  def index
    @users = User.all
    @over_time = Kintai.all.group(:user_id).sum(:over_time)
    
  end

  def create
    @kintai = Kintai.new(kintai_params)
    case params[:commit]
      when "出勤" ; session[:start_time] = Time.now
      when "退勤" ; session[:end_time] = Time.now
    end
    # 出勤、退勤ボタンを押した時の処理、出勤ボタンのみでは一時保存で出勤と退勤が揃うと保存される
    if session[:start_time] != nil && session[:end_time] != nil
      @kintai[:start_time] = session[:start_time]
      @kintai[:end_time] = session[:end_time]
      session[:over_time] = (@kintai[:end_time] - @kintai[:start_time]).floor / 3600 - 8
      # 残業時間がマイナスの場合の処理
      if session[:over_time] < 0
        session[:over_time] = 0
      end
      @kintai[:over_time] = session[:over_time]
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
    params.permit(:start_time, :end_time, :over_time).merge(user_id: current_user.id)
  end
