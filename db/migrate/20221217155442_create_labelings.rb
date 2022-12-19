class CreateLabelings < ActiveRecord::Migration[7.0]
  def change
    create_table :labelings, id: :uuid do |t|
      t.references :label, type: :uuid, null: false, foreign_key: true
      t.uuid :labelable_id, type: :uuid, null: false
      t.string :labelable_type, null: false
      t.index :labelable_id

      t.timestamps
    end
  end
end
