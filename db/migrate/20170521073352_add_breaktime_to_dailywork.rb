class AddBreaktimeToDailywork < ActiveRecord::Migration
  def change
    add_column :dailyworks, :breaktime1, :float
    add_column :dailyworks, :breaktime2, :float
  end
end
