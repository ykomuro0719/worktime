class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :requesttitle, null: false
    end
  end
end
