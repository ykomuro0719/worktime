class CreateSelectChild1s < ActiveRecord::Migration
  def change
    create_table :select_child1s do |t|
      t.integer :task_id
      t.integer :taskIndex
      t.integer :child1_id
    end
  end
end
