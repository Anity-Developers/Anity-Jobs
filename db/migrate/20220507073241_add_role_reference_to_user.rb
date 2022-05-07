class AddRoleReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, foreign_key: true, index: true
  end
end
