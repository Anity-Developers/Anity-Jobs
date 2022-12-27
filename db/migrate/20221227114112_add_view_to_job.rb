class AddViewToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :view, :integer, default: 0
  end
end
