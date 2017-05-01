class CreateSelectchild2s < ActiveRecord::Migration
  def change
    create_table :selectchild2s do |t|
      t.integer :child1task_id
      t.integer :child2task_id
    end
  end
end
