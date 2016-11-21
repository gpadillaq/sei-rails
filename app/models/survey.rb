class Survey < ApplicationRecord

  def display_name
    [self.inicio, self.fin].join(' a ')
  end
end
