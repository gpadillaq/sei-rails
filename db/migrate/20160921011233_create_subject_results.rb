class CreateSubjectResults < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_results do |t|
      t.belongs_to :user_survey, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.belongs_to :answer, foreign_key: true

      t.timestamps
    end
  end
end
