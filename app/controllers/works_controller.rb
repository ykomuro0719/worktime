class WorksController < ApplicationController
    before_action :authenticate_user! ,:initial
    
    def index
    @works = Work.where(user_id: current_user.id)
    
    end
    
    def new
    @work = Work.new
    @dt = params[:date]
    @works = Work.where("date":@dt).where(user_id: current_user.id)
    @allworks = Work.where("date":@dt).where(user_id: current_user.id)
    @validtasks = @tasks.where("taskstartdate <= ?" ,@dt ).where("taskenddate >= ?",@dt )
    @validchild1tasks = @child1tasks.where("child1startdate <= ?" ,@dt ).where("child1enddate >= ?",@dt )
    @validchild2tasks = @child2tasks.where("child2startdate <= ?" ,@dt ).where("child2enddate >= ?",@dt )
    @validrequests = @requests.where("requeststartdate <= ?" ,@dt ).where("requestenddate >= ?",@dt )
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
        @works = Work.where("date":@dt).where(user_id: current_user.id)
       
    end

    def update
        @work = Work.find(params[:id])
        @work.update(work_params)
        dt = @work.date

        redirect_to :action => "show", :date => dt.to_s
    end

    def show
    
        @works = Work.where(date: params[:date]).where(user_id: current_user.id)  
        @dt = params[:date]
    end

    def destroy
        @work = Work.find(params[:id])
        @work.destroy
        redirect_to :back
    end
    
    def getchild1
        
        @validchild1tasks = Task.joins(:child1tasks).includes(:child1tasks).where(tasks: {id: params[:task_id]})
        
    end
    
    def getchild2
        
        @validchild2tasks = Child1task.joins(:child2tasks).includes(:child2tasks).where(child1tasks: {id: params[:child1task_id]})
    end
    
    def getrequest
        
        @validrequests = Task.joins(:requests).includes(:requests).where(tasks: {id: params[:task_id]})

    end



     private
    def work_params
      params.require(:work).permit(:date, :work, :work_time, :user_id, :task_id,
                                     :child1task_id, :child2task_id, :request_id, :id )
    end
    def initial
        @tasks = Task.all
        @users = User.all
        @child1tasks = Child1task.all
        @child2tasks = Child2task.all
        @requests = Request.all
        @sum_time = 0
    end
    
  
end
