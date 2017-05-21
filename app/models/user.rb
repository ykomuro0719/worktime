# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default("f"), not null
#  eid                    :integer
#  group1_id              :integer
#  group2_id              :integer
#  group3_id              :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :works, dependent: :destroy
  has_many :dailyworks, dependent: :destroy
  #has_many :groups
  #accepts_nested_attributes_for :groupusers, allow_destroy: true
  
  belongs_to :group1, :class_name => 'Group', :foreign_key => 'group1_id'  
  belongs_to :group2, :class_name => 'Group', :foreign_key => 'group2_id' 
  belongs_to :group3, :class_name => 'Group', :foreign_key => 'group3_id'
  
  
  
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    clean_up_passwords
    update_attributes(params, *options)
  end
  
  
  
end
