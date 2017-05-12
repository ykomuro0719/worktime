class AddDetailsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :requeststartdate, :date
    add_column :requests, :requestenddate, :date
  end
end
