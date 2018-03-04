class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

   def new
        @user = User.new
        authorize @user
    end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

   def create

        @user = User.new(secure_params)
        authorize @user
        if @user.save
            redirect_to user_url, notice: "User succesfully created!" 
        else
            render :new
        end
    end

  private

  def secure_params
    params.require(:user).permit(:email,:name,:password, :password_confirmation, :current_password, :role)
  end

end
