class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :stripe_customer_id
      t.references :user, null: false, foreign_key: true
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end
  end
end
