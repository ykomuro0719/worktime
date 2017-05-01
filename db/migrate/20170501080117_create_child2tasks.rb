class CreateChild2tasks < ActiveRecord::Migration
  def change
    create_table :child2tasks do |t|

      t.string :child2title, null: false
    end
  end
end
