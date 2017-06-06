class AddDetailsToChild2tasks < ActiveRecord::Migration
  def change
    add_column :child2tasks, :child2startdate, :date
    add_column :child2tasks, :child2enddate, :date
  end
end
