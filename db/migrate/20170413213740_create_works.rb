class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id
      t.date :date
      t.string :work
      t.float :work_time
      t.integer :task_id
      t.integer :child1Task_id
      t.integer :child2Task_id
      t.integer :request_id
      t.timestamps null: false
    end
  end
end
