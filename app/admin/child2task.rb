ActiveAdmin.register Child2task do
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

filter :child2title
filter :child2startdate, as: :date_range
filter :child2enddate, as: :date_range
filter :child2status, as: :check_boxes
filter :child1tasks, as: :select, collection: proc { Child1task.all }


permit_params :child2title, :child2status, :child2startdate, :child2enddate


end
