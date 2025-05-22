class CreateProductoEjemplars < ActiveRecord::Migration[8.0]
  def change
    create_table :producto_ejemplars do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :ejemplar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
