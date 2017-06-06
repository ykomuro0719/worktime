class Admin::GroupsController < ApplicationController

    before_action :initial 
    def index
        
        
    end
    def new
        @group = Group.new
        
    end
    def create
        @group = Group.create(group_params)
        @group.save    
        redirect_to :back
    end
    def show
        @group = Group.find(params[:id])
        
    end
    def edit
        @group = Group.find(params[:id])
        
        
    end
    def update
        @group = Group.find(params[:id])
        @group.update(group_params)
        redirect_to :back
    end
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to :back
        
    end
    private
    def initial
        @groups = Group.all
    end
    def group_params
      params.require(:group).permit(:groupname, :groupdetail, :groupstatus, :groupstartdate, :groupenddate,
      grouptasks_attributes: [:task_id, :group_id, :_destroy, :id])
    end
  
end
