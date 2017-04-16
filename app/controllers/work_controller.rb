class WorkController < ApplicationController
    before_action :authenticate_user!
    def index
    @works = Work.all
    end
    
    def new
    @work = Work.new
    
    end

    def create
        @work = Work.new(post_params)
        @work.save
        redirect_to @work
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
    end

     private
    def post_params
      params.require(:work).permit(:date, :work, :work_time )
    end
    
end
