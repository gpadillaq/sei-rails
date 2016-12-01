class SurveyComment < ApplicationRecord
  self.table_name = "survey_comments"
  belongs_to :user_survey
end
