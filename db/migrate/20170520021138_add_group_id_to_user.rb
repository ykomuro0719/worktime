class AddGroupIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :group1_id, :integer
    add_column :users, :group2_id, :integer
    add_column :users, :group3_id, :integer
  end
end
