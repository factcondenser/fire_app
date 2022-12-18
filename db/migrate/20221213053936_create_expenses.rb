class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.string :description, limit: 255
      t.datetime :incurred_at, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true, index: false
      t.references :category, type: :uuid, null: false, foreign_key: { to_table: :expense_categories }, index: false
      t.index [:user_id, :category_id, :incurred_at]
      t.index [:user_id, :incurred_at]

      t.timestamps
    end
  end
end
