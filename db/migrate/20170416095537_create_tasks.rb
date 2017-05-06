class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :tasktitle, null: false
      
    end
  end
end
