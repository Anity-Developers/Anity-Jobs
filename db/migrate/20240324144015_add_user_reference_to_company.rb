class AddUserReferenceToCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :admin, foreign_key: { to_table: :users }, optional: true
  end
end
