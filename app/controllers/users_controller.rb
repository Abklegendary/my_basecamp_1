class UsersController < ApplicationController
    before_action :authenticate_user!
    after_action :verify_authorized
   
   
     def index
       authorize User
       
       @users = User.all
       
     end
   
     def show
       @user = User.find(params[:id])
       authorize @user
     end
   
     def admin
       user = User.find params[:id]
       user.update( :admin => true)
       redirect_to users_path
     end
   
     def authorized_user
       @k = current_user.admin?
       redirect_to users_path, alert: "NOT AUTHORIZED!! Only an admin can do this" if @k==false
     end

     def update
       @user = User.find(params[:id])
       authorize @user

       if @user.update_attributes(secure_params)
        redirect_to users_path, :success => "User updated"
      else
        redirect_to users_path, :alert => "Unable to update user"
      end
     end

     def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to users_path, :notice => "User deleted"
    end

    private

      def secure_params
        params.require(:user).permit(:role)
      end
   
   end
   