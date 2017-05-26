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
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Work < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  belongs_to :task
  validates :task_id, presence: true
  
  belongs_to :child1task
  belongs_to :child2task
  belongs_to :request
  
  validates :work_time, presence: true
  validates :comment,      length: { maximum: 200 } 
private  

end
 
