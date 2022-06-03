class AddLocationToCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :location, null: false, foreign_key: true
  end
end
