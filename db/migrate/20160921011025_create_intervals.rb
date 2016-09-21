class CreateIntervals < ActiveRecord::Migration[5.0]
  def change
    create_table :intervals do |t|
      t.text :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
