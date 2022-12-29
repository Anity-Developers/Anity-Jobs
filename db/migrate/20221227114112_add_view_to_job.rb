class AddViewToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :views, :integer, default: 0
  end
end
