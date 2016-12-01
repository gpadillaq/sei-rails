class CreateQuestionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_types do |t|
      t.text :codigo
      t.text :descripcion

      t.timestamps
    end
  end
end
