class CreatePrestamos < ActiveRecord::Migration[8.0]
  def change
    create_table :prestamos do |t|
      t.date :fecha_ini
      t.date :fecha_fin
      t.boolean :devuelto
      t.references :ejemplar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
