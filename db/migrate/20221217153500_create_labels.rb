class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels, id: :uuid do |t|
      t.string :name, null: false, limit: 63
      t.references :user, type: :uuid, null: false, foreign_key: true, index: false
      t.index [:user_id, :name], unique: true

      t.timestamps
    end
  end
end
