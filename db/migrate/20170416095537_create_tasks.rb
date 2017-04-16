class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :task,              null: false, default: ""
      t.string :subtask,              null: false, default: ""
    end
  end
end
