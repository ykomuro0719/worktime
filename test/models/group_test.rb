# == Schema Information
#
# Table name: groups
#
#  id             :integer          not null, primary key
#  groupname      :string           not null
#  groupstartdate :date
#  groupenddate   :date
#  groupstatus    :boolean          default("f"), not null
#  groupdetail    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
