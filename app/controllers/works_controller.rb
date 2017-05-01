class WorksController < ApplicationController
    before_action :authenticate_user! ,:initial
    def index
    @works = Work.all
    
    end
    
    def new
    @work = Work.new
    @dt = params[:date]
    @works = Work.where("date":@dt)
    end

    def create
        @dt = params[:date]
        @work = Work.create(work_params)
        @work.save
        redirect_to :back
    end

    def edit
        @work = Work.find(params[:id])
        @dt = @work.date
        @works = Work.where("date":@dt)
        
       
    end

    def update
            @work = Work.find(params[:id])
            @work.update(work_params)
            dt = @work.date

        redirect_to :action => "show", :date => dt.to_s
    end

    def show
        @works = Work.where(date: params[:date])  
         
        @dt = params[:date]
    end

    def destroy
        @work = Work.find(params[:id])
        @work.destroy
        redirect_to :back
    end

     private
    def work_params
      params.require(:work).permit(:date, :work, :work_time, :user_id, :task_id,
                                     :child1task_id, :child2task_id, :request_id, :id )
    end
    def initial
        @task = Task.all
        @user = User.all
        @sum_time = 0
    end
    
  
end
