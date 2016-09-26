class UserSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :user_type
  belongs_to :level
  belongs_to :group
  belongs_to :interval
  belongs_to :subject

  def display_name
    [self.user_type.display_name, self.level.display_name,
     self.group.display_name].join('/')
  end
end
