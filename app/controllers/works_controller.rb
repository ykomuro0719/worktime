class WorksController < ApplicationController
    before_action :authenticate_user! ,:initial
    before_action :set_dailywork1, only: [:new, :show, :edit, :create, :destroy]
    before_action :set_dailywork2, only: [:new ]
    after_action :set_daytime, only: [:create, :update, :destroy ]
    @@dt = nil

    def index
        @works = Work.where(user_id: current_user.id)
        @dailyworks = Dailywork.where(user_id: current_user.id)
        
    
    end
    
    def new
        @work = Work.new
        @dt = params[:date]
        
        @@dt = @dt
        @works = Work.where("date":@dt).where(user_id: current_user.id)
        @allworks = Work.where("date":@dt).where(user_id: current_user.id)
        

        @validtasks = Task.joins(:groups).includes(:groups)
        .where("taskstartdate <= ?" ,@dt ).where("taskenddate >= ?",@dt )
        
        @grouptasks = @validtasks.where(groups:{id: current_user.group1_id} )
        .or(@validtasks.where(groups:{id: current_user.group2_id} ))
        .or(@validtasks.where(groups:{id: current_user.group3_id} ))  
        
        @validchild1tasks = Child1task.none
        @validchild2tasks = Child2task.none
        @validrequests = Request.none
        
    end

    def create
        @dt = params[:date]
        @work = Work.create(work_params)
        @work.save
        @works = Work.where("date": @work.date).where(user_id: current_user.id)
        #binding.pry
        
        @workstart = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workstart
        @workend = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workend
        @daytime = @workend - @workstart
    end

    def edit
        @work = Work.find(params[:id])
        @@dt = @dt = @work.date
        
        @validtasks = Task.joins(:groups).includes(:groups)
        .where("taskstartdate <= ?" ,@dt ).where("taskenddate >= ?",@dt )
        
        @grouptasks = @validtasks.where(groups:{id: current_user.group1_id} )
        .or(@validtasks.where(groups:{id: current_user.group2_id} ))
        .or(@validtasks.where(groups:{id: current_user.group3_id} ))
        
        
        @validchild1tasks = @child1tasks.where("child1startdate <= ?" ,@dt ).where("child1enddate >= ?",@dt )
        @validchild2tasks = @child2tasks.where("child2startdate <= ?" ,@dt ).where("child2enddate >= ?",@dt )
        @validrequests = @requests.where("requeststartdate <= ?" ,@dt ).where("requestenddate >= ?",@dt )
        @works = Work.where("date":@dt).where(user_id: current_user.id)
       
    end

    def update
        @work = Work.find(params[:id])
        @work.update(work_params)
        #dt = @work.date
        @works = Work.where("date": @work.date).where(user_id: current_user.id)

    end

    def show
        
        @works = Work.where(date: work_params[:date]).where(user_id: current_user.id)  
        @dt = work_params[:date]
    end

    def destroy
        @work = Work.find(params[:id])
        @works = Work.where("date": @work.date).where(user_id: current_user.id)
        @work.destroy
        
    end
    
    def getchild1

        @validchild1tasks = Task.joins(:child1tasks).includes(:child1tasks)
        .where(tasks: {id: params[:task_id].to_i})
        .where("child1startdate <= ?" ,@@dt )
        .where("child1enddate >= ?",@@dt )
        
    end
    
    def getchild2
        
        @validchild2tasks = Child1task.joins(:child2tasks).includes(:child2tasks)
        .where(child1tasks: {id: params[:child1task_id].to_s})
        .where("child2startdate <= ?" ,@@dt )
        .where("child2enddate >= ?",@@dt )
    end
    
    def getrequest
        
        @validrequests = Task.joins(:requests).includes(:requests)
        .where(tasks: {id: params[:task_id]})
        .where("requeststartdate <= ?" ,@@dt )
        .where("requestenddate >= ?",@@dt )
    end

    def getworkstart
        
        @dailywork = Dailywork.where(user_id: current_user.id).find_by(date: @@dt)
        @dailywork.update(workstart: params[:workstart])
        
        #render :nothing => true

    end
    def getworkend
        
        @dailywork = Dailywork.where(user_id: current_user.id).find_by(date: @@dt)
        @dailywork.update(workend: params[:workend])
        #render :nothing => true
    end
    
    def getbreaktime1
        
        @dailywork = Dailywork.where(user_id: current_user.id).find_by(date: @@dt)
        @dailywork.update(breaktime1: params[:breaktime1])
        render :nothing => true
        
    end

     private
    def work_params
      params.require(:work).permit(:date, :comment, :work_time, :user_id, :task_id,
                                     :child1task_id, :child2task_id, :request_id, :id )
    end
    def dailywork_params
      params.require(:dailywork).permit(:date, :workstart, :workend, :breaktime1, :user_id, :id )
    end
    
    def initial
        @tasks = Task.all
        @users = User.all
        @child1tasks = Child1task.all
        @child2tasks = Child2task.all
        @requests = Request.all
        @sum_time = 0
    end
    def set_dailywork1
        if @@dt.blank? && params[:date].present?
            @@dt = params[:date]
        end
        
        
        if Dailywork.where(user_id: current_user.id).find_by("date": params[:date]).blank?
            @workstart = 10.0
            @workend  = 19.0
            @breaktime1 = 1.0
            
        else
            @workstart = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workstart
            @workend = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workend
            @breaktime1 = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).breaktime1
        end
        

        @daytime = @workend - @workstart
    end
    
    def set_dailywork2    
        if  Dailywork.find_by("date": params[:date], "user_id": current_user.id).blank?
            @dailywork = Dailywork.create("date": params[:date], "user_id": current_user.id, "workstart": @workstart , "workend": @workend,"breaktime1": @breaktime1 )
            @dailywork.save
        end
    end
    
    def set_daytime
        @workstart = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workstart
        @workend = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).workend
        @breaktime1 = Dailywork.where(user_id: current_user.id).find_by("date": @@dt).breaktime1
        
        @daytime = @workend - @workstart
    end
  
end
