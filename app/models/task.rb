# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  tasktitle     :string           not null
#  taskstatus    :boolean          default("f"), not null
#  taskstartdate :date
#  taskenddate   :date


class Task < ActiveRecord::Base
    
    has_many :works
    has_many :selectchild1s
    has_many :child1tasks, through: :selectchild1s
    has_many :selectrequests
    has_many :requests, through: :selectrequests
    accepts_nested_attributes_for :selectchild1s, allow_destroy: true
    accepts_nested_attributes_for :selectrequests, allow_destroy: true
    
    belongs_to :user
    
    has_many :grouptasks
    has_many :groups, through: :grouptasks
    
    validates :tasktitle, uniqueness: true, presence: true
    
    def display_name
        self.tasktitle 
    end
    
end
 
