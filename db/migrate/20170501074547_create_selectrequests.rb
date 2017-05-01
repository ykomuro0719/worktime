class CreateSelectrequests < ActiveRecord::Migration
  def change
    create_table :selectrequests do |t|
      t.integer :task_id
      t.integer :request_id
    end
  end
end
