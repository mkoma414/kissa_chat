class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def search
    @users = User.where.not(id: current_user.id).where('name like ?', "#{params[:search_key]}%") #.where.not('user_id #{current_user.id}')
    respond_to do |format|
      format.json
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
