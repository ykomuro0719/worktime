class AddEidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :eid, :integer
  end
end
