class AddDeletedAtToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :deleted_at, :datetime
  end
end
