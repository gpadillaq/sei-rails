class AddFieldSurveyToUserSurvey < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_surveys, :survey, index: true
    add_foreign_key :user_surveys, :surveys
  end
end
