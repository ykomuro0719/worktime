class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_admin
    def authenticate_admin
      if current_user.try(:admin?)
      else
      redirect_to root_path
      end
    end
end
