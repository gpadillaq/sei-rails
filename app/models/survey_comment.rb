class SurveyComment < ApplicationRecord
  self.table_name = "subject_comments"
  belongs_to :user_survey
end
