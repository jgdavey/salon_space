class UsersController < ApplicationController
  before_filter :check_signup_enabled
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Thanks for signing up!"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated user."
      redirect_to root_url
    else
      render :edit
    end
  end
  
  private
  
  def check_signup_enabled
    if Setting[:signup_disabled]
      flash[:error] = "Signup is disabled at this time."
      redirect_to root_url
    end
  end
end
