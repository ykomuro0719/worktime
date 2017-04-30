class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :requestTitle
    end
  end
end
