class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized_user, only: :index
  after_action :verify_authorized
   
   
  def index
    skip_authorization # Skip authorization for the index action
       
    @users = User.all
       
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def authorized_user
    @k = current_user.admin?
    puts "Admin Status: #{@k}"
    #Rails.logger.debug("Admin Status: #{@k}") # Log the value of @k
    redirect_to users_path unless current_user.admin?
  end

  def admin
    user = User.find(params[:id])
    user.update(admin: true)
    redirect_to users_path
  end  

  def update
    @user = User.find(params[:id])
    authorize @user
  
    if @user.update(user_params)
      redirect_to @user, notice: 'User role was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @user = User.find(params[:id])
    authorize @user

    if @user.destroy
      redirect_to users_path, notice: "User was successfully deleted."
    else
      redirect_to users_path, alert: "Failed to delete user."
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:role)
  end
  
  def authorized_user
  # Redirect to the root path only if the user is neither an admin nor a user
  redirect_to root_path unless current_user.admin? || current_user.user?
 end

end
  