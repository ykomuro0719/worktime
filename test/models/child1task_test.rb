# == Schema Information
#
# Table name: child1tasks
#
#  id              :integer          not null, primary key
#  child1title     :string           not null
#  child1status    :boolean          default("f"), not null
#  child1startdate :date
#  child1enddate   :date
#

require 'test_helper'

class Child1taskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
