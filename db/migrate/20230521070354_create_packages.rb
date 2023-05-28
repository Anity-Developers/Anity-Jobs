class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.integer :package_type, default: 0, null: false

      t.timestamps
    end
  end
end
