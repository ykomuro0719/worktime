ActiveAdmin.register Child1task do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :child1title
filter :child1startdate, as: :date_range
filter :child1enddate, as: :date_range
filter :child1status, as: :check_boxes
filter :child2tasks, as: :select, collection: proc { Child1task.all }
#filter :requests, as: :select, collection: proc { Request.all }
#filter :user_id, as: :select, collection: proc { User.all }
#filter :user_group1_id_or_user_group2_id_or_user_group3_id, as: :check_boxes, collection: proc { Group.all }, label: 'グループ'




permit_params :child1title, :child1status, :child1startdate, :child1enddate,
        selectchild2s_attributes: [:child1task_id, :child2task_id, :_destroy, :id]

 form(:html => { :multipart => true }) do |f|
    f.inputs "Tasks" do
      f.input :child1title
      f.input :child1status
      f.input :child1startdate
      f.input :child1enddate
      
    end
 
    f.inputs do
      f.has_many :selectchild2s, heading: '分類2', allow_destroy: true, new_record: true do |a|
        
        a.input :child2task_id,
                 label: '分類2',
                 as: :select,
                 collection: Child2task.all.map { |p| [p.child2title, p.id] }
      end
    end
 
    f.actions
  end


end
