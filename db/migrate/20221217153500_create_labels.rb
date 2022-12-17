class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels, id: :uuid do |t|
      t.string :name, null: false, limit: 63
      t.index :name, unique: true

      t.timestamps
    end
  end
end
