class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :id
      t.string :titulo
      t.string :fecha

      t.timestamps
    end
  end
end
