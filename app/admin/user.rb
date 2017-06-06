ActiveAdmin.register User do
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

#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default("f"), not null
#  eid                    :integer
#  group1_id              :integer
#  group2_id              :integer
#  group3_id              :integer
#

filter :name
filter :email
filter :eid
filter :group1_id_or_group2_id_or_group3_id , as: :check_boxes, collection: proc { Group.all }, label: 'グループ'
#filter :task_id, as: :select, collection: proc { Task.all }
#filter :child1task_id, as: :select, collection: proc { Child1task.all }
#filter :child2task_id, as: :select, collection: proc { Child2task.all }
#filter :request_id, as: :select, collection: proc { Request.all }



  index do
    column :id
    column :name
    column :email 
    column :eid
    column :group1_id
    column :group2_id
    column :group3_id
    actions defaults: true
  end
    
    
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default("f"), not null
#  eid                    :integer
#  group1_id              :integer
#  group2_id              :integer
#  group3_id              :integer

end
