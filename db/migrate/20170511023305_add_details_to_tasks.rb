class AddDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :taskstartdate, :date
    add_column :tasks, :taskenddate, :date
  end
end
