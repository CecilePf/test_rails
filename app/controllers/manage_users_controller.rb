class ManageUsersController < ApplicationController

  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.update(role_id_params)
    redirect_to manage_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to manage_users_path
  end

  def role_id_params
    params.require(:user).permit(:role_id)
  end

end