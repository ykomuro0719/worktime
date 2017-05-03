class CreateChild1tasks < ActiveRecord::Migration
  def change
    create_table :child1tasks do |t|

      t.string :child1title, null: false

    end
  end
end
