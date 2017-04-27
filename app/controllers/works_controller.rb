class WorksController < ApplicationController
    before_action :authenticate_user! 
    def index
    @works = Work.all
    
    end
    
    def new
    @work = Work.new
    @task = Task.all
    @user = User.all
    @dt = params[:date]
    end

    def create
        @dt = params[:date]
        @work = Work.create(work_params)
        @work.save
        redirect_to :action => "show", :date => @work.date
    end

    def edit
        @work = Work.find(params[:id])
        @task = Task.all
        @user = User.all
        @dt = params[:date]
        
       
    end

    def update
            @work = Work.find(params[:id])
            @work.update(work_params)
        
        redirect_to :action => "show", :date => @work.date
    end

    def show
        @works = Work.where(date: params[:date])  
        @sum_time = 0 
        @dt = params[:date]
    end

    def destroy
        @work = Work.find(params[:id])
        @work.destroy
        redirect_to :back
    end

     private
    def work_params
      params.require(:work).permit(:date, :work, :work_time, :user_id, :task_id, :id )
    end
    
  
end
