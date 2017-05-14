class CreateDailyworks < ActiveRecord::Migration
  def change
    create_table :dailyworks do |t|
      t.integer :user_id, null: false
      t.date :date, null: false
      t.time :workstart, null: false
      t.time :workend, null: false
      t.timestamps null: false
    end
  end
end
