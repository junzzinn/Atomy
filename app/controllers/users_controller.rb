class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  attr_accessor :custom_text

  def index
    @users = User.includes(:calendar_events)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    begin
      @user.destroy
      redirect_to users_url, notice: 'User was successfully deleted.'
    rescue ActiveRecord::InvalidForeignKey => e
      flash[:alert] = "Cannot delete user due to associated records: #{e.message}"
      redirect_to @user
    end
  end

  def save_text
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to logs_index_path
  end

  def save_text
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Custom text saved successfully!"
    else
      flash[:error] = "Failed to save custom text."
    end
    redirect_to logs_index_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone_number, :bio, :custom_text, products_attributes: [:id, :name, :_destroy])
  end
end
