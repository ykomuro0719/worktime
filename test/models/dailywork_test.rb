# == Schema Information
#
# Table name: dailyworks
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  date       :date             not null
#  workstart  :float            not null
#  workend    :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DailyworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
