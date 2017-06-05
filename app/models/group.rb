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


class Group < ActiveRecord::Base
  has_many :users
  has_many :works, through: :users
  has_many :grouptasks
  has_many :tasks, through: :grouptasks
  accepts_nested_attributes_for :grouptasks, allow_destroy: true
  
  def display_name
      self.groupname 
  end
  
end
