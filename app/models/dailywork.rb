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
#  breaktime1 :float
#  breaktime2 :float
#

class Dailywork < ActiveRecord::Base
  belongs_to :user
  
  #has_many :groups, through: :user
  
end
