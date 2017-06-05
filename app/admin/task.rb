ActiveAdmin.register Task do
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

#  id            :integer          not null, primary key
#  tasktitle     :string           not null
#  taskstatus    :boolean          default("f"), not null
#  taskstartdate :date
#  taskenddate   :date

filter :tasktitle
filter :taskstartdate, as: :date_range
filter :taskenddate, as: :date_range
filter :taskstatus, as: :check_boxes
filter :child1tasks, as: :select, collection: proc { Child1task.all }
filter :requests, as: :select, collection: proc { Request.all }
filter :grouptasks_group_id, as: :check_boxes, collection: proc { Group.all }, label: 'グループ'


permit_params :tasktitle, :taskstatus, :taskstartdate, :taskenddate,
        selectchild1s_attributes: [:task_id, :child1task_id, :_destroy, :id],
        selectrequests_attributes: [:task_id, :request_id, :_destroy, :id]

 form(:html => { :multipart => true }) do |f|
    f.inputs "Tasks" do
      f.input :tasktitle
      f.input :taskstatus
      f.input :taskstartdate
      f.input :taskenddate
      
    end
 
    f.inputs do
      f.has_many :selectchild1s, heading: '分類1', allow_destroy: true, new_record: true do |a|
        
        a.input :child1task_id,
                 label: '分類1',
                 as: :select,
                 collection: Child1task.all.map { |p| [p.child1title, p.id] }
      end
    end
 
     f.inputs do
      f.has_many :selectrequests, heading: '要求元', allow_destroy: true, new_record: true do |a|
        
        a.input :request_id,
                 label: '要求元',
                 as: :select,
                 collection: Request.all.map { |p| [p.requesttitle, p.id] }
      end
    end
 
    f.actions
  end


end
