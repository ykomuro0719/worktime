class AddChild1statussToChild2task1 < ActiveRecord::Migration
  def change
    add_column :child1tasks, :child1status, :boolean, null: false, default: false
  end
end
