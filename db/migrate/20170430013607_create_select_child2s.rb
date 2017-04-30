class CreateSelectChild2s < ActiveRecord::Migration
  def change
    create_table :select_child2s do |t|
      t.integer :child1_id
      t.integer :child1Index
      t.integer :child2_id
    end
  end
end
