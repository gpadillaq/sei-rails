class Question < ApplicationRecord
  belongs_to :user_type
  belongs_to :question_type

  def display_name
    self.descripcion
  end
end
