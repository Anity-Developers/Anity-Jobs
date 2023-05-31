class AddPackageToCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :package, null: true, foreign_key: true
  end
end
