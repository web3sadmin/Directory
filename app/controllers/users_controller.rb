class UsersController < ApplicationController
  #before_action :set_index, only: [:show]
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
  if @user.admin?
  	@user.update_attribute :admin, false
  else
    @user.update_attribute :admin, true
  end
  	redirect_to request.referrer, notice: "Профиль пользователя обновлен."
  end
end
