class AddCategoryToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :category, null: false, foreign_key: true
  end
end
