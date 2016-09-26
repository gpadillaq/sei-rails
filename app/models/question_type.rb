class QuestionType < ApplicationRecord

  def display_name
    self.codigo
  end
end
