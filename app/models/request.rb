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

class Request < ActiveRecord::Base

    has_many :works
    has_many :selectrequests
    has_many :tasks, through: :selectrequests
    
    validates :requesttitle, uniqueness: true, presence: true
        
    def display_name
        self.requesttitle 
    end
    
end
