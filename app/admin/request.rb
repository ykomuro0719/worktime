ActiveAdmin.register Request do
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

filter :requesttitle
filter :requeststartdate, as: :date_range
filter :requestenddate, as: :date_range
filter :requeststatus, as: :check_boxes
#filter :child2tasks, as: :select, collection: proc { Child1task.all }

permit_params :requesttitle, :requeststatus, :requeststartdate, :requestenddate

end
