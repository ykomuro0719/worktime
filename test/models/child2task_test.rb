# == Schema Information
#
# Table name: child2tasks
#
#  id              :integer          not null, primary key
#  child2title     :string           not null
#  child2status    :boolean          default("f"), not null
#  child2startdate :date
#  child2enddate   :date
#

require 'test_helper'

class Child2taskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
