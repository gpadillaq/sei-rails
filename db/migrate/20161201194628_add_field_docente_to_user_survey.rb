class AddFieldDocenteToUserSurvey < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_surveys, :docente, index: true
    add_foreign_key :user_surveys, :users, column: :docente_id
  end
end
