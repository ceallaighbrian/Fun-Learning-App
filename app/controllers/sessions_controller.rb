class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      result = user.award_login_bonus
      flash[:success] = result unless result.blank?
      redirect_to user
    else
      flash.now[:danger] = 'Invalid login in details'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
