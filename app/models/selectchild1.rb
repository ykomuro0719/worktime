# == Schema Information
#
# Table name: selectchild1s
#
#  id            :integer          not null, primary key
#  task_id       :integer
#  child1task_id :integer
#

class Selectchild1 < ActiveRecord::Base
    belongs_to :task
    belongs_to :child1task
end

