class Admin::AggregatesController < ApplicationController
  autocomplete :user, :name, :full => true
  
  def index
    #binding.pry
    @q        = User.search(params[:q])
    @users = @q.result(distinct: true).joins(:works, :dailyworks).includes(:works, :dailyworks)
    .order(:name).order("works.date").order("dailyworks.date")
    @groups = Group.all
    if params[:q].present?
      @startdate = params[:q][:works_date_gteq_to_date].to_date
      @enddate = params[:q][:works_date_lteq_to_date].to_date
    end
  end
  def search
    
  end
  def show
    binding.pry
    @q        = Work.search(params[:q])
    @works = @q.result(distinct: true)
  end
end
