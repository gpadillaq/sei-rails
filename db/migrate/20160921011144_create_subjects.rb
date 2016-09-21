class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.text :codigo
      t.text :nombre

      t.timestamps
    end
  end
end
