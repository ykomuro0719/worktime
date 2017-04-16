class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :user_id
      t.date :date
      t.string :work
      t.integer :work_time
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
