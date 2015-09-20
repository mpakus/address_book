class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :share]

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

  def share
    mail_to = params[:mail_to]
    if mail_to.blank? || user.blank?
      return redirect_to users_path, alert: t('.fail')
    end
    UserMailer.share(user, mail_to).deliver_now
    redirect_to users_path, notice: t('.success')
  end

  private

  def users
    @users ||= User.page(params[:page])
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
