class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :user_type, foreign_key: true
      t.text :descripcion
      t.belongs_to :question_type, foreign_key: true

      t.timestamps
    end
  end
end
