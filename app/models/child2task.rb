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

class Child2task < ActiveRecord::Base

    has_many :works
    has_many :selectchild2s
    has_many :child1tasks, through: :selectchild2s
    
    validates :child2title, uniqueness: true, presence: true
    
    def display_name
        self.child2title 
    end
    
end
