class Child1task < ActiveRecord::Base
    has_many :works
    has_many :selectchild1s
    has_many :tasks, through: :selectchild1s
    has_many :selectchild2s
    has_many :child2tasks, through: :selectchild2s
    accepts_nested_attributes_for :selectchild2s, allow_destroy: true
end
