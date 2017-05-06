# == Schema Information
#
# Table name: selectrequests
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  request_id :integer
#

class Selectrequest < ActiveRecord::Base
    belongs_to :task
    belongs_to :request
end
