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

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
