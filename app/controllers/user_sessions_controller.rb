class UserSessionsController < ApplicationController
	# before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
# layout "user"
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
	# puts current_user_session.user
      flash[:notice] = "Login successful!"
	  # puts current_user.to_s+"111"
      redirect_back_or_default user_url(current_user_session.user)
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
