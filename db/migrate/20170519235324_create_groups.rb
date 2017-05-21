class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname, null: false
      t.date :groupstartdate
      t.date :groupenddate     
      t.boolean :groupstatus, null: false, default: false
      t.text :groupdetail
      t.timestamps null: false
    end
  end
end
