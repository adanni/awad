class UsersController < ApplicationController
  include SessionsHelper
  before_filter :admin_user, only: :destroy

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
    @users = User.where(role: nil)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def show
    # @recommendation_result = recommend(User.find(params[:id]))
    # split_result = (User.find(params[:id]).email).split(/@/); @name = split_result[0]
    # @recommended_places = School.where('postcode LIKE ?', "%#{@recommendation_result}%").limit(3)
    @user = User.find(params[:id])
    split_to_array = (@user.email).split(/@/)
    @name = split_to_array[0]
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

   private

    def admin_user
      redirect_to(root_path) unless current_user.role == "admin"
    end

    def recommend(args)
      @recommendation = ''
      split_args =  args.split("")
      count = 0
      3.times do
        @recommendation << split_args[count]
        count += 1
      end
      @recommendation
    end

end
