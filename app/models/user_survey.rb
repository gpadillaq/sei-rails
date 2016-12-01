class UserSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :user_type
  belongs_to :level
  belongs_to :group
  belongs_to :interval
  belongs_to :subject
  belongs_to :survey
  belongs_to :docente, foreign_key: :docente_id, class_name: 'User'

  validates :user_id, presence: true
  validates :user_type_id, presence: true
  validates :survey_id, presence: true

  def display_name
    [self.user_type.display_name, self.level.display_name,
     self.group.display_name].join('/')
  end
end
