class UsersController < ApplicationController
    before_action :authenticate_admin, only: :index
    def index
        @users = User.all
    end
 
    def show

        if current_user.id == params[:id].to_i
            @user = User.find(params[:id])
        elsif current_user.admin
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end
    end
end
