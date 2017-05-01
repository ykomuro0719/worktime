class Admin::TasksController < Admin::ApplicationController
    before_action :initial 
    def index
        
    end
    def new
        @task = Task.new
        @task.selectchild1s.build
        @task.selectrequests.build
        
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
        #@task.select_child1s = SelectChild1.where("task_id": params[:id] )
        
        
    end
    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        #@selectchild1s = SelectChild1.where("task_id": params[:id] )
        #@selectchild1s.each do |selectchild1|
        #    selectchild1 = SelectChild1.update(selectchild1_params)
        #end
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
        @child1tasks = Child1task.all
        @child2Tasks = Child2task.all
    end 
    def task_params
        params.require(:task).permit(:tasktitle, 
            selectchild1s_attributes: [:id, :task_id, :child1task_id, :_destroy],
            selectrequests_attributes: [:id, :task_id, :request_id, :_destroy]
            )
    end
    #def selectchild1_params
    #        params.require(:select_child1).permit(:task_id, :child1Task_id)
            
    #end

            # これは独特な書き方ですが、このように子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられます。
            #この場合だと、bookテーブルにあるuser_idにもきちんとこの時作成される親要素のidがふられます。
    
    



end

