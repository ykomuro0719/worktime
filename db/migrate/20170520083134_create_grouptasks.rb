class CreateGrouptasks < ActiveRecord::Migration
  def change
    create_table :grouptasks do |t|
      t.integer :group_id, null: false
      t.integer :task_id, null: false
    end
  end
end
