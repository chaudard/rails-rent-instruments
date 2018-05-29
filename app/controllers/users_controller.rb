class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
