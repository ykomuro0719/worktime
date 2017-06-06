# == Schema Information
#
# Table name: requests
#
#  id               :integer          not null, primary key
#  requesttitle     :string           not null
#  requeststatus    :boolean          default("f"), not null
#  requeststartdate :date
#  requestenddate   :date
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
