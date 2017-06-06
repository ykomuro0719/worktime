class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id
      t.date :date
      t.float :work_time
      t.integer :task_id
      t.integer :child1task_id
      t.integer :child2task_id
      t.integer :request_id
      t.text :comment
      t.timestamps null: false
    end
  end
end
