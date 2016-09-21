class Question < ApplicationRecord
  belongs_to :user_type
  belongs_to :question_type
end
