class CreateLabelings < ActiveRecord::Migration[7.0]
  def change
    create_table :labelings, id: :uuid do |t|
      t.uuid :labelable_id, type: :uuid, null: false
      t.string :labelable_type, null: false

      t.references :label, type: :uuid, null: false, foreign_key: true

      t.index [:labelable_id, :label_id], unique: true

      t.timestamps
    end
  end
end
