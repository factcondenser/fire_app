class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.string :description, limit: 255
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :category, type: :uuid, null: false, foreign_key: { to_table: :expense_categories }

      t.timestamps
    end
  end
end
