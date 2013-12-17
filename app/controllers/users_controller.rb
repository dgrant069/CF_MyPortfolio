class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # def new
  #   redirect_to users_path
  # end

  # def create
  #   redirect_to users_path
  # end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: "User was successfully marked as owner"
    else
      redirect_to user_path(@user), notice: "Action failed"
    end
  end

  def destroy
    @user = User.find(params[:id])
    # authorize @user
    @user.destroy

    redirect_to users_path, notice: "User was successfully destroyed"
  end
end

