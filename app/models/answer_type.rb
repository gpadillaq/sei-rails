class AnswerType < ApplicationRecord

  def display_name
    self.descripcion
  end
end
