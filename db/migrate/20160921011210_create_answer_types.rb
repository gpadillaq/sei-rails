class CreateAnswerTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_types do |t|
      t.text :descripcion
      t.decimal :scala

      t.timestamps
    end
  end
end
