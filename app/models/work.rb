class Work < ActiveRecord::Base
  #def to_params
  #  date
  #end
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :task
  validates :task_id, presence: true
  
  belongs_to :child1task
  belongs_to :child2task
  belongs_to :request
end
 