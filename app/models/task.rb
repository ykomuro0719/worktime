# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  tasktitle  :string           not null
#  taskstatus :boolean          default("f"), not null
#

class Task < ActiveRecord::Base
    has_many :works
    has_many :selectchild1s
    has_many :child1tasks, through: :selectchild1s
    has_many :selectrequests
    has_many :requests, through: :selectrequests
    accepts_nested_attributes_for :selectchild1s, allow_destroy: true
    accepts_nested_attributes_for :selectrequests, allow_destroy: true
    
    validates :tasktitle, uniqueness: true, presence: true
end
 
