class Group < ApplicationRecord

  def display_name
    self.nombre
  end
end
