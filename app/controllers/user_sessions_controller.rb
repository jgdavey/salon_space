class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    if @user_session
      @user_session.destroy
      flash[:notice] = "Successfully logged out."
    else
      flash[:error] = "You were already logged out."
    end
    redirect_to root_url
  end
end
