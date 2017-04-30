class Admin::Child2tasksController < Admin::ApplicationController
    
    before_action :initial 
    def index
        
        
    end
    def new
        @child2task = Child2Task.new
        
    end
    def create
        @child2task = Child2Task.create(child2task_params)
        @child2task.save    
        redirect_to :back
    end
    def show
        @child2task = Child2Task.find(params[:id])
        
    end
    def edit
        @child2task = Child2Task.find(params[:id])
        
        
    end
    def update
        @child2task = Child2Task.find(params[:id])
        @child2task.update(child2task_params)
        redirect_to :back
    end
    def destroy
        @child2task = Child2Task.find(params[:id])
        @child2task.destroy
        redirect_to :back
        
    end
    private
    def initial
        @child2tasks = Child2Task.all
    end
    def child2task_params
      params.require(:child2_task).permit(:child2Title )
    end
    
end
