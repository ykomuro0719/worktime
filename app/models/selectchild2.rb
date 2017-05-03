# == Schema Information
#
# Table name: selectchild2s
#
#  id            :integer          not null, primary key
#  child1task_id :integer
#  child2task_id :integer
#

class Selectchild2 < ActiveRecord::Base
    belongs_to :child1task
    belongs_to :child2task
end
