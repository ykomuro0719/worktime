ActiveAdmin.register Work do
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
#  user_id       :integer
#  date          :date
#  work_time     :float
#  task_id       :integer
#  child1task_id :integer
#  child2task_id :integer
#  request_id    :integer
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


filter :user_id, as: :select, collection: proc { User.all }
filter :user_group1_id_or_user_group2_id_or_user_group3_id , as: :check_boxes, collection: proc { Group.all }, label: 'グループ'
filter :date, as: :date_range
filter :work_time
filter :task_id, as: :select, collection: proc { Task.all }
filter :child1task_id, as: :select, collection: proc { Child1task.all }
filter :child2task_id, as: :select, collection: proc { Child2task.all }
filter :request_id, as: :select, collection: proc { Request.all }



end
