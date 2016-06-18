class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if UserService.new.create_user(user_params)
      flash[:notice] = I18n.t('messages.user.created')
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = I18n.t('messages.user.updated')
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
