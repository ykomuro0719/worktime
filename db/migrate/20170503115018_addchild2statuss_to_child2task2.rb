class Addchild2statussToChild2task2 < ActiveRecord::Migration
  def change
    add_column :child2tasks, :child2status, :boolean, null: false, default: false
  end
end
