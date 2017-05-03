# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  date          :date
#  work_time     :float
#  task_id       :integer
#  child1task_id :integer
#  child2task_id :integer
#  request_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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
 
