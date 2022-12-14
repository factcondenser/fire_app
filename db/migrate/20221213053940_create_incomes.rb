class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes, id: :uuid do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.string :description, limit: 255
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :category, type: :uuid, null: false, foreign_key: { to_table: :income_categories }

      t.timestamps
    end
  end
end
