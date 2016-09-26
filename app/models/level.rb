class Level < ApplicationRecord

  def display_name
    self.nombre    
  end
end
