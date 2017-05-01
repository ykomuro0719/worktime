class Child2task < ActiveRecord::Base
    has_many :works
    has_many :selectchild2s
    has_many :child1tasks, through: :selectchild2s
end
