class CreateChild2Tasks < ActiveRecord::Migration
  def change
    create_table :child2_tasks do |t|
      t.string :child2Title
    end
  end
end
