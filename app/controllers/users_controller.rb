class UsersController < ApplicationController
    before_action :identifyuser, only: [:show, :edit, :update]
    before_action :authenticate_admin, only: [:index, :new, :destroy]

    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        binding.pry
        @user.save
        redirect_to :back
    end
    def show

    end
    def edit
        @groups = Group.all
        
    end
    def update
            @user.update_without_current_password(user_params)
            #binding.pry
            redirect_to user_path(params[:id])
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy_all
        redirect_to users_path, notice: 'User was successfully deleted'
    end
    

    private
    def identifyuser
        @user = User.find(params[:id])
        unless current_user.id == @user.id || current_user.admin
            redirect_to(root_path)
        end
    end
        
    
    def user_params
        if current_user.admin  then
            params.require(:user).permit(:name, :email, :eid, :password, :password_confirmation, :admin,
            :group1_id, :group2_id, :group3_id)
        else
            params.require(:user).permit(:name, :email, :eid, :password, :password_confirmation,
            :group1_id, :group2_id, :group3_id)
        end
    end
end


