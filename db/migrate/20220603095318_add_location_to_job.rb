class AddLocationToJob < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :location, null: false, foreign_key: true
  end
end
