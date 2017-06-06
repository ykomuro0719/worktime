ActiveAdmin.register Dailywork do
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


filter :user_id, as: :select, collection: proc { User.all }
filter :user_group1_id_or_user_group2_id_or_user_group3_id , as: :check_boxes, collection: proc { Group.all }, label: 'グループ'
filter :date, as: :date_range
filter :workstart
filter :workend
filter :breaktime1

  index do
    column :user_id
    column :date
    column :workstart 
    column :workend
    column :breaktime1
    actions defaults: true

  end


end
