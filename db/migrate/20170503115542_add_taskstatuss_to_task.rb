class AddTaskstatussToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :taskstatus, :boolean, null: false, default: false
  end
end
