class Admin::Child1tasksController < Admin::ApplicationController
    
    before_action :initial 
    def index
        
    end
    def new
        @child1task = Child1task.new
        @child1task.selectchild2s.build

    end
    def create
        @child1task = Child1task.create(child1task_params)
        @child1task.save    
        redirect_to :back
    end
    def show
        @child1task = Child1task.find(params[:id])
        
    end
    def edit
        @child1task = Child1task.find(params[:id])
        
        
    end
    def update
        @child1task = Child1task.find(params[:id])
        @child1task.update(child1task_params)
        redirect_to :back
    end
    def destroy
        @child1task = Child1task.find(params[:id])
        @child1task.destroy
        redirect_to :back
        
    end
    private
    def initial
        @child1tasks = Child1task.all
        @child2tasks = Child2task.all
    end
    def child1task_params
      params.require(:child1task).permit(:child1title,
        selectchild2s_attributes: [:id, :task_id, :child2task_id, :_destroy]
      )
    end
end
