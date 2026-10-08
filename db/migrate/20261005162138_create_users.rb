class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false
      t.index :email, unique: true

      t.timestamps
    end
  end
end
