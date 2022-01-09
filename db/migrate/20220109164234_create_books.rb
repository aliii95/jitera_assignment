class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :rate, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :books, :isbn, unique: true
  end
end
