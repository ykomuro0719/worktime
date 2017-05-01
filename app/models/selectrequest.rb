class Selectrequest < ActiveRecord::Base
    belongs_to :task
    belongs_to :request
end
