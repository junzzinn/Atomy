class LogsController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render json: { error: "Failed to update user text." }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_text)
  end
end
