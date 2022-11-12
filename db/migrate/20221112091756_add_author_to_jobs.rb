class AddAuthorToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :user, null: true, foreign_key: true

    reversible do |dir|
      dir.up do
        first_user = User.first
        Job.update_all(user_id: first_user.id)
      end
    end

    change_column_null :jobs, :user_id, false
  end
end
