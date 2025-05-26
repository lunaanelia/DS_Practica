class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :titulo
      t.boolean :es_peli
      t.string :autor
      t.date :fecha
      t.string :descripcion

      t.timestamps
    end
  end
end
