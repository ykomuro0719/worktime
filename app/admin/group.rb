ActiveAdmin.register Group do
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

filter :groupname
filter :groupstartdate, as: :date_range
filter :groupenddate, as: :date_range
#filter :taskstatus, as: :check_boxes
filter :tasks, as: :select, collection: proc { Task.all }
#filter :requests, as: :select, collection: proc { Request.all }
filter :users_id, as: :select, collection: proc { User.all }
#filter :user_group1_id_or_user_group2_id_or_user_group3_id, as: :check_boxes, collection: proc { Group.all }, label: 'グループ'


end
