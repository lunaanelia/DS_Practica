class CreateAutors < ActiveRecord::Migration[8.0]
  def change
    create_table :autors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
