class WorksController < ApplicationController
    before_action :authenticate_user! 
    def index
    @works = Work.all
    end
    
    def new
    @work = Work.new(params[:date])
    @task = Task.all
    @dt = params[:date]
    end

    def create
        @work = Work.create(work_params)
        redirect_to works_path
    end

    def edit
        @work = Work.new
        @work.date = params[:date]
        @task = Task.all
        @user = User.all
        
       
    end

    def update
        #@work = Work.create(params)
        if  params[:id].nil? then
            @work = Work.create(params)
        else
            @work = Work.find(params[:id])
            @work.Update(params)
        end
        redirect_to edit_work_path(@work.date)
    end

    def show
        @works = Work.where(date: params[:date])  
        @sum_time = 0 
    end

    def destroy
    end

     private
    def work_params
      params.require(:work).permit(:date, :work, :work_time, :user_id, :task_id )
    end
    
  
end
