class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes, id: :uuid do |t|
      t.integer :amount_cents, null: false, limit: 8
      t.string :description, limit: 255
      t.datetime :incurred_at, null: false
      t.references :created_by, type: :uuid, null: false, foreign_key: { to_table: :users }, index: false
      t.references :incurred_by, type: :uuid, null: false, foreign_key: { to_table: :users }, index: false
      t.references :category, type: :uuid, null: false, foreign_key: { to_table: :income_categories }, index: false
      # These indices cover the following query scenarios:
      # - Incomes I added incurred by me, sort-filterable by incurrance date, last-modified date, or category.
      # - Incomes I added incurred by someone else, sort-filterable by incurrance date, last-modified date, or category.
      # - Incomes someone else added incurred by me, sort-filterable by incurrance date, last-modified date, or category.
      t.index [:created_by_id, :incurred_by_id, :incurred_at, :category_id], name: 'idx_incomes_on_created_by_incurred_by_incurred_at_and_category'
      t.index [:created_by_id, :incurred_by_id, :updated_at, :category_id], name: 'idx_incomes_on_created_by_incurred_by_updated_at_and_category'

      t.timestamps
    end
  end
end
