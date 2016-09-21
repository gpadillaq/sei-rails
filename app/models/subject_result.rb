class SubjectResult < ApplicationRecord
  belongs_to :user_survey
  belongs_to :question
  belongs_to :answer
end
