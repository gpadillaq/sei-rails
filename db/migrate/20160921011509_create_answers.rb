class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :user_type, foreign_key: true
      t.text :descripcion
      t.belongs_to :answer_type, foreign_key: true

      t.timestamps
    end
  end
end
