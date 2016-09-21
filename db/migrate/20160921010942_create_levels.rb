class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.text :nombre

      t.timestamps
    end
  end
end
