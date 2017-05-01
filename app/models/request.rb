class Request < ActiveRecord::Base
    has_many :works
    has_many :selectrequests
    has_many :tasks, through: :selectrequests
end
