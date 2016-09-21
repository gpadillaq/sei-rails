class UserSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :user_type
  belongs_to :level
  belongs_to :group
  belongs_to :interval
  belongs_to :subject
end
