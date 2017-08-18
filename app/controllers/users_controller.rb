class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :user_logged_in, only: [:new]

  def new
    @user=User.new
  end

  def create
    @user= User.create(user_params)
    if @user.valid?
      session[:user_id]=@user.id
      redirect_to lists_path
    else
      flash[:errors]= @user.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:errors]= @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
  end

  def set_user
   @user = User.find(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
