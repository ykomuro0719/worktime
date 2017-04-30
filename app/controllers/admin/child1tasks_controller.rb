class Admin::Child1tasksController < Admin::ApplicationController
    
    before_action :initial 
    def index
        
        
    end
    def new
        @child1task = Child1Task.new
        
    end
    def create
        @child1task = Child1Task.create(child1task_params)
        @child1task.save    
        redirect_to :back
    end
    def show
        @child1task = Child1Task.find(params[:id])
        
    end
    def edit
        @child1task = Child1Task.find(params[:id])
        
        
    end
    def update
        @child1task = Child1Task.find(params[:id])
        @child1task.update(child1task_params)
        redirect_to :back
    end
    def destroy
        @child1task = Child1Task.find(params[:id])
        @child1task.destroy
        redirect_to :back
        
    end
    private
    def initial
        @child1tasks = Child1Task.all
    end
    def child1task_params
      params.require(:child1_task).permit(:child1Title )
    end
    
end
