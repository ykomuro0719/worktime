class AddRequeststatussToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :requeststatus, :boolean, null: false, default: false
  end
end
