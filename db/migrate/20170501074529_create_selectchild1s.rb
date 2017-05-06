class CreateSelectchild1s < ActiveRecord::Migration
  def change
    create_table :selectchild1s do |t|
      t.integer :task_id
      t.integer :child1task_id
    end
  end
end
