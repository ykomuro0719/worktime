class Admin::Child2tasksController < Admin::ApplicationController
    
    before_action :initial 
    def index
        
        
    end
    def new
        @child2task = Child2task.new
        
    end
    def create
        @child2task = Child2task.create(child2task_params)
        @child2task.save    
        redirect_to :back
    end
    def show
        @child2task = Child2task.find(params[:id])
        
    end
    def edit
        @child2task = Child2task.find(params[:id])
        
        
    end
    def update
        @child2task = Child2task.find(params[:id])
        @child2task.update(child2task_params)
        redirect_to :back
    end
    def destroy
        @child2task = Child2task.find(params[:id])
        @child2task.destroy
        redirect_to :back
        
    end
    private
    def initial
        @child2tasks = Child2task.all
    end
    def child2task_params
      params.require(:child2task).permit(:child2title, :child2status )
    end
    
end
