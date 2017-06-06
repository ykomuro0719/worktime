class CreateDailyworks < ActiveRecord::Migration
  def change
    create_table :dailyworks do |t|
      t.integer :user_id, null: false
      t.date :date, null: false
      t.float :workstart, null: false
      t.float :workend, null: false
      t.timestamps null: false
    end
  end
end
