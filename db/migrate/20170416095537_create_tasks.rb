class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :tasktitle
      
    end
  end
end
