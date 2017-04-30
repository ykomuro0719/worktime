class CreateChild1Tasks < ActiveRecord::Migration
  def change
    create_table :child1_tasks do |t|
      t.string :child1Title
    end
  end
end
