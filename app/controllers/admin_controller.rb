class AdminController < ApplicationController
    before_action :authenticate_admin, :initial
    def authenticate_admin
      if current_user.try(:admin?)
      else
      redirect_to root_path
      end
    end
    
    def index
        @dt = Date.today
        @dt0 = (@dt - 0).mday
        @dt1 = (@dt - 1).mday
        @dt2 = (@dt - 2).mday
        @dt3 = (@dt - 3).mday
        @dt4 = (@dt - 4).mday
        @dt5 = (@dt - 5).mday
        @dt6 = (@dt - 6).mday
    end
    def initial
        @works = Work.all
        @users = User.all
    end
end
