# == Schema Information
#
# Table name: requests
#
#  id           :integer          not null, primary key
#  requesttitle :string           not null
#

class Request < ActiveRecord::Base
    has_many :works
    has_many :selectrequests
    has_many :tasks, through: :selectrequests
    
    validates :requesttitle, uniqueness: true, presence: true
end
