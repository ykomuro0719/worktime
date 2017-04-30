class Admin::TasksController < Admin::ApplicationController
    before_action :initial 
    def index
        
        
    end
    def new
        @task = Task.new
        
    end
    def create
        @task = Task.create(task_params)
        @task.save    
        redirect_to :back
    end
    def show
        @task = Task.find(params[:id])
        
    end
    def edit
        @task = Task.find(params[:id])
        
        
    end
    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to :back
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to :back
        
    end
    private
    def initial
        @tasks = Task.all
        @requests = Request.all
        @child1tasks = Child1Task.all
        @child2Tasks = Child2Task.all
    end 
    def task_params
      params.require(:task).permit(:taskTitle )
    end
    



end

