class Task < ActiveRecord::Base
    has_many :works
    has_many :selectchild1s
    has_many :child1tasks, through: :selectchild1s
    has_many :selectrequests
    has_many :requests, through: :selectrequests
    accepts_nested_attributes_for :selectchild1s, allow_destroy: true
    #accepts_nested_attributes_for :select_child2s, allow_destroy: true
    accepts_nested_attributes_for :selectrequests, allow_destroy: true
end
 