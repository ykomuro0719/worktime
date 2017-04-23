class Work < ActiveRecord::Base
  def to_param
    date
  end
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :task
  validates :task_id, presence: true
end
