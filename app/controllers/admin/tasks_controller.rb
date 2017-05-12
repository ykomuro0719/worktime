class Admin::TasksController < Admin::ApplicationController
    before_action :initial 
    def index
        
    end
    def new
        @task = Task.new
        @task.selectchild1s.build
        
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
        @child1tasks = Child1task.all
        @child2Tasks = Child2task.all
    end 
    def task_params
        params.require(:task).permit(:tasktitle, :taskstatus, :taskstartdate, :taskenddate,
        selectchild1s_attributes: [:task_id, :child1task_id, :_destroy, :id],
        selectrequests_attributes: [:task_id, :request_id, :_destroy, :id])
            # これは独特な書き方ですが、このように子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられます。
            #この場合だと、bookテーブルにあるuser_idにもきちんとこの時作成される親要素のidがふられます。
    end
    



end

