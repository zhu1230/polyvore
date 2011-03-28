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
	respond_to do |wants|
		wants.html {redirect_back_or_default user_url(current_user_session.user)}
       wants.text {render :text => "ok:success"}
	end
    else
	respond_to do |wants|
		
    wants.html { render :action => :new}
	wants.text {render :text => "error:"+@user_session.errors.full_messages.join('-')}
	end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
