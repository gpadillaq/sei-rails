class Answer < ApplicationRecord
  belongs_to :user_type
  belongs_to :answer_type
end
