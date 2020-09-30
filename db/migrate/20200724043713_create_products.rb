class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :make
      t.decimal :price, precision: 18, scale: 2, default: 0.0
      t.integer :total_quantity
      t.timestamps
    end
  end
end
