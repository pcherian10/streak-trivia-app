class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json:@users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
   @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user
    else
      render json: {errors:"Could not create user."}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      @user.save
      render json: @user
    else
      render json: {errors: "Could not update user."}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :email, :password, :streak)
  end


end