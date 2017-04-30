class Admin::RequestsController < Admin::ApplicationController

    before_action :initial 
    def index
        
    end
    def new
        @request = Request.new
        
    end
    def create
        @request = Request.create(request_params)
        @request.save    
        redirect_to :back
    end
    def show
        @request = Request.find(params[:id])
        
    end
    def edit
        @request = Request.find(params[:id])
        
        
    end
    def update
        @request = Request.find(params[:id])
        @request.update(request_params)
        redirect_to :back
    end
    def destroy
        @request = Request.find(params[:id])
        @request.destroy
        redirect_to :back
        
    end
    private
    def initial
        @requests = Request.all
    end
    def request_params
      params.require(:request).permit(:requestTitle, :id )
    end
    
    
end
