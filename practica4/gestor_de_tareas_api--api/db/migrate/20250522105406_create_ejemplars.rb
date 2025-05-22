class CreateEjemplars < ActiveRecord::Migration[8.0]
  def change
    create_table :ejemplars do |t|
      t.references :producto, null: false, foreign_key: true
      t.boolean :disponible

      t.timestamps
    end
  end
end
