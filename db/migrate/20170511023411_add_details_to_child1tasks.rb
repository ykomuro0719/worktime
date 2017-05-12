class AddDetailsToChild1tasks < ActiveRecord::Migration
  def change
    add_column :child1tasks, :child1startdate, :date
    add_column :child1tasks, :child1enddate, :date
  end
end
