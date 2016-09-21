class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.text :nombre
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end
end
