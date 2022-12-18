class CreateLabelings < ActiveRecord::Migration[7.0]
  def change
    create_table :labelings, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true, index: false
      t.references :label, type: :uuid, null: false, foreign_key: true, index: false
      t.uuid :labelable_id, type: :uuid, null: false
      t.string :labelable_type, null: false
      t.index [:user_id, :label_id]
      t.index :labelable_id

      t.timestamps
    end
  end
end
