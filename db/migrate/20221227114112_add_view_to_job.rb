class AddViewToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :views, :integer, default: 0

    reversible do |dir|
      dir.up do
        Job.update_all(views: 0)
      end
    end
  end
end
