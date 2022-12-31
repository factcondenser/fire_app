class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.citext :email, null: false
      t.string :password_digest, null: false

      t.index :email, unique: true

      t.timestamps
    end
  end
end
