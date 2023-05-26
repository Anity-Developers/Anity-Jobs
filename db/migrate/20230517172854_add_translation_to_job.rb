class AddTranslationToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :translation, :integer, default: 0
  end
end
