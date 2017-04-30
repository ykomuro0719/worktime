class CreateSelectRequests < ActiveRecord::Migration
  def change
    create_table :select_requests do |t|
      t.integer :task_id
      t.integer :taskIndex
      t.integer :request_id
    end
  end
end
