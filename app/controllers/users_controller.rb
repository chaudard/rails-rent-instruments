class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
  end

  def create
    authorize @user
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
