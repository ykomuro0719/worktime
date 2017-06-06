# == Schema Information
#
# Table name: grouptasks
#
#  id       :integer          not null, primary key
#  group_id :integer          not null
#  task_id  :integer          not null
#

class Grouptask < ActiveRecord::Base
    belongs_to :group
    belongs_to :task
end
