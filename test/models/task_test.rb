# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  tasktitle  :string           not null
#  taskstatus :boolean          default("f"), not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
