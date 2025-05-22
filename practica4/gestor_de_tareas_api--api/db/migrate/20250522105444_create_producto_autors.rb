class CreateProductoAutors < ActiveRecord::Migration[8.0]
  def change
    create_table :producto_autors do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
