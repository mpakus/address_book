class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def create
    if user.save
      redirect_to users_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if user.update(user_params)
      redirect_to users_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to users_url, notice: t('.success')
  end

  private

  def users
    @users ||= User.all
  end
  helper_method :users

  def user
    @user ||= User.new(user_params)
  end
  helper_method :user

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(
      :first_name, :last_name,
      phones_attributes: [:id, :phone, :_destroy],
      emails_attributes: [:id, :email, :_destroy]
    )
  end
end
