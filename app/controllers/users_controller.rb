class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_user, only: [:index, :new, :edit]
  before_filter :accessible_roles, only: [:new, :edit, :show, :update, :create]
  load_and_authorize_resource only: [:show, :new, :destroy, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end 

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was succesfully created."
      redirect_to users_path
    else
      @title = "Sign Up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      sign_in @user, :bypass => true if current_user.id == @user.id
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to users_url
  end

  def get_user
    @current_user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :password, :password_confirmation)
  end
end

