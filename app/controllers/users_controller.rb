class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in @user
      flash.now[:success] = "Account Successfully Created"
      redirect_to @user 
    else
      render "new"
    end

  end

  def edit
    @user = User.find(params[:id])
  end

   def index
    @users = User.where(:admin => nil)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
    @name = email_to_name(@user)
    @schools = School.find(:all)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Update successful!"
      log_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def welcome
  end

end
