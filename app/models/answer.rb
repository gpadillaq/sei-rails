class Answer < ApplicationRecord
  belongs_to :user_type
  belongs_to :answer_type

  def display_name
    self.answer_type.display_name
  end
end
