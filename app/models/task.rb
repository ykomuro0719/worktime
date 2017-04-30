class Task < ActiveRecord::Base
    has_many :works
    has_many :select_child1s
end
