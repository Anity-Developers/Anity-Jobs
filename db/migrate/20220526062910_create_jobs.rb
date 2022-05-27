class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :company, foreign_key: true
      t.string :application_url
      t.timestamps
    end
  end
end
