class WorksController < ApplicationController
    before_action :authenticate_user!
    def index
    @works = Work.all
    end
    
    def new
    @work = Work.new(params[:date])
    @task = Task.all
    @dt =params[:date]
    end

    def create
        @work = Work.create(post_params)
        redirect_to works_path
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
